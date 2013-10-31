require "spec_helper"

describe Company do
  it "has a valid factory" do
    expect(build(:company)).to be_valid
  end
  it "is invalid without name" do
    expect(build(:company, name: nil)).to have(1).errors_on(:name)
  end
  it "is invalid without address" do
    expect(build(:company,  address: nil)).to have(1).errors_on(:address)
  end
  it "is invalid without url" do
    expect(build(:company,  url: nil)).to have(2).errors_on(:url)
  end
  it "is invalid if the url does not exist or is not responding " do
    expect(build(:company,  url: "http://www.fakeurlthatwontwork.com")).to have(1).errors_on(:url)
  end
  it "is invalid without show_address" do
    expect(build(:company,  show_address: nil)).to have(1).errors_on(:show_address)
  end
  it "is invalid without show_as_customer" do
    expect(build(:company,  show_as_customer: nil)).to have(1).errors_on(:show_as_customer)
  end
end