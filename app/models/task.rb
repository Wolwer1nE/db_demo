class Task < ApplicationRecord
  validates_presence_of :title, :description
  has_many :assignments
  has_many :users, through: :assignments
  has_one :review

  belongs_to :creator, class_name: "User"
end