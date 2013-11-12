class JobExperience < ActiveRecord::Base
  validates :name, presence: true
end
