require 'spec_helper'

describe JobExperience do
  it 'has a valid factory' do
    expect(build(:job_experience)).to be_valid
  end
  it 'is invalid without name' do
    expect(build(:job_experience, name: nil)).to have(1).errors_on(:name)
  end
end