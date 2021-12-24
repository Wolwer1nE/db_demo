class Review < ApplicationRecord
  validates_presence_of :text
  belongs_to :task
  belongs_to :reviewer, class_name: "User"
end