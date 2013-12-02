require 'spec_helper'

describe JobSkill do
  it 'has a valid factory' do
    expect(build(:job_skill)).to be_valid
  end
  it 'is invalid without name' do
    expect(build(:job_skill, name: nil)).to have(1).errors_on(:name)
  end
  it 'is invalid without version' do
    expect(build(:job_skill, version: nil )).to have(1).errors_on(:version)
  end
end
