require 'spec_helper'

describe JobType do
  it 'has a valid factory' do
    expect(build(:job_type)).to be_valid
  end
  it 'is invalid without name' do
    expect(build(:job_type, name: nil)).to have(1).errors_on(:name)
  end
  it 'is invalid without skills' do
    expect(build(:job_type, skills: nil )).to have(1).errors_on(:skills)
  end
end
