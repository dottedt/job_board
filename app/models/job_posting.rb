class JobPosting < ActiveRecord::Base
  validates :job_experience_id, :job_type_id, :title, :would_have_done, :compensation, :nice_to_have , presence: true
  validates :relocation, inclusion: {in: [true, false], message: 'requires a true or false value'}
  validates :remote, inclusion: {in: [true, false], message: 'requires a true or false value'}
  validates :freelance, inclusion: {in: [true, false], message: 'requires a true or false value'}

  has_many :job_experiences
  has_many :job_types
end
