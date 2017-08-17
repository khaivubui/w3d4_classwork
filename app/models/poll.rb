# == Schema Information
#
# Table name: polls
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Poll < ApplicationRecord
  validates :title, :user_id, presence: true

  belongs_to :author,
             foreign_key: :user_id,
             primary_key: :id,
             class_name: :User

  has_many :questions,
           foreign_key: :poll_id,
           primary_key: :id,
           class_name: :Question

  # has_many :responses,
  #           through: :questions,
  #           source: :responses
end
