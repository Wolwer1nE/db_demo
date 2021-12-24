class Assignment < ApplicationRecord

  validate {correct_access_levels?}

  belongs_to :user
  belongs_to :task

  def correct_access_levels?
    errors.add "Access level of #{user.name} is too low" if user.access_level < task.access_level
  end

end