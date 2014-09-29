class JobPosting < ActiveRecord::Base
  validates :job_experience_id, :job_type_id, :title, :would_have_done, :compensation, :nice_to_have , presence: true
  validates :relocation, inclusion: {in: [true, false], message: 'requires a true or false value'}
  validates :remote, inclusion: {in: [true, false], message: 'requires a true or false value'}
  validates :freelance, inclusion: {in: [true, false], message: 'requires a true or false value'}

  belongs_to :job_experience
  belongs_to :job_type

  delegate :name, to: :job_experience, prefix: true
  delegate :name, to: :job_type, prefix: true
end
