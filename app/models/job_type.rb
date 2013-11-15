class JobType < ActiveRecord::Base
  validates :name, :skills, presence: true
  has_many :job_postings
end
