# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true

  has_many :authored_polls,
           primary_key: :id,
           foreign_key: :user_id,
           class_name: :Poll

  has_many :responses,
           primary_key: :id,
           foreign_key: :user_id,
           class_name: :Response

  def completed_polls
    all_polls = Poll.all
    all_polls = all_polls.map do |poll|
      poll = poll.questions
    end
    questions = all_polls.select{|poll| poll.all?{|question| question.responses.any?{|response| response.user_id == self.id}}}
    questions.map { |question| question.poll }.uniq
  end
end
