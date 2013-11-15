class JobExperience < ActiveRecord::Base
  validates :name, presence: true
  has_many :job_postings
end
