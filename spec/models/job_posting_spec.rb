require 'spec_helper'

describe JobPosting do
  it 'has a valid factory' do
    expect(build(:job_posting)).to be_valid
  end
  it 'is invalid without experience' do
    expect(build(:job_posting, experience: nil)).to have(1).errors_on(:experience)
  end
  it 'is invalid without category' do
    expect(build(:job_posting, category: nil )).to have(1).errors_on(:category)
  end
  it 'is invalid without title' do
    expect(build(:job_posting, title: nil)).to have(1).errors_on(:title)
  end
  it 'is invalid without relocation' do
    expect(build(:job_posting, relocation: nil)).to have(1).errors_on(:relocation)
  end
  it 'is invalid without remote' do
    expect(build(:job_posting, remote: nil)).to have(1).errors_on(:remote)
  end
  it 'is invalid without freelance' do
    expect(build(:job_posting, freelance: nil)).to have(1).errors_on(:freelance)
  end
  it 'is invalid without would_have_done' do
    expect(build(:job_posting, would_have_done: nil)).to have(1).errors_on(:would_have_done)
  end
  it 'is invalid without compensation' do
    expect(build(:job_posting, compensation: nil)).to have(1).errors_on(:compensation)
  end
  it 'is invalid without nice_to_have' do
    expect(build(:job_posting, nice_to_have: nil)).to have(1).errors_on(:nice_to_have)
  end
end
