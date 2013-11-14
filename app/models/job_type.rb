class JobType < ActiveRecord::Base
  validates :name, :skills, presence: true
  belongs_to :job_posting
end
