class JobExperience < ActiveRecord::Base
  validates :name, presence: true
  belongs_to :job_posting
end
