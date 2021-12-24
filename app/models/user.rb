class User < ApplicationRecord

  validates_presence_of :name, :password_digest

  has_many :assignments
  has_many :tasks, through: :assignments

  has_many :reviews, foreign_key: 'reviewer_id'

  has_many :owned_tasks, class_name: 'Task',
           foreign_key: 'creator_id'
end