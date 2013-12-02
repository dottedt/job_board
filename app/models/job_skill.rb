class JobSkill < ActiveRecord::Base
  validates :name, :version, presence: true
end
