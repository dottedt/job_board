class JobPosting < ActiveRecord::Base
  validates :experience, :category, :title, :would_have_done, :compensation, :nice_to_have , presence: true
  validates :relocation, inclusion: {in: [true, false], message: 'requires a true or false value'}
  validates :remote, inclusion: {in: [true, false], message: 'requires a true or false value'}
  validates :freelance, inclusion: {in: [true, false], message: 'requires a true or false value'}
end
