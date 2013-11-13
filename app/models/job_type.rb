class JobType < ActiveRecord::Base
  validates :name, :skills, presence: true
end
