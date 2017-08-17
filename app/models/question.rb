# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  text       :string           not null
#  poll_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Question < ApplicationRecord
  validates :text, :poll_id, presence: true

  has_many :answer_choices,
           foreign_key: :question_id,
           primary_key: :id,
           class_name: :AnswerChoice

  belongs_to :poll,
             foreign_key: :poll_id,
             primary_key: :id,
             class_name: :Poll

  has_many :responses,
           through: :answer_choices,
           source: :responses

  def results
    answer_choices = self.answer_choices.includes(:responses)
    hash = {}
    answer_choices.each do |answer_choice|
      hash[answer_choice.text] = answer_choice.responses.length
    end
    hash
  end
end
