# == Schema Information
#
# Table name: responses
#
#  id               :integer          not null, primary key
#  user_id          :integer          not null
#  question_id      :integer          not null
#  answer_choice_id :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Response < ApplicationRecord
  validates :user_id, :answer_choice_id, presence: true
  validate :respondent_not_poll_author, :respondent_already_answered?

  belongs_to :answer_choice,
             foreign_key: :answer_choice_id,
             primary_key: :id,
             class_name: :AnswerChoice

  belongs_to :respondent,
             foreign_key: :user_id,
             primary_key: :id,
             class_name: :User

  has_one :question,
          through: :answer_choice,
          source: :question

  def sibling_responses
    self.question.responses
    .where.not("responses.id = ?", self.id)
  end

  def respondent_already_answered?
    condition = self.sibling_responses
      .where.not("responses.user_id = ?", self.user_id)
      .empty?
    if condition
      errors[:respondent] << "Cannot respond twice"
    end
  end

  def respondent_not_poll_author
    condition = self.respondent == self.answer_choice.question.poll.author
    if condition
      errors[:respondent] << "Cannot respond to your own poll"
    end
  end

end
