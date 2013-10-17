require "spec_helper"

describe Company do
   before do
     @company = Company.new(name: "Test Company 1", address: "1234 N. North, Chicago Il 60642", show_address:"t", url:"http://www.fakeurl.com", show_as_customer:"f")
   end

   subject {@company}

   it { should respond_to(:name)}
   it { should respond_to(:address)}
   it { should respond_to(:show_address)}
   it { should respond_to(:url)}
   it { should respond_to(:show_as_customer)}

   describe "when name is not present" do
    before { @company.name = " " }
    it { should_not be_valid }
  end
   describe "when address is not present" do
    before {@company.address = " "}
    it {should_not be_valid}
  end
  describe "when show_addres is not present" do
    before {@company.show_address = " "}
    it {should_not be_valid}
  end
  describe "when url is not present" do
    before {@company.url = " " }
    it {should_not be_valid}
  end
  describe "when show_as_customer is not present" do
    before {@company.show_as_customer = " "}
    it {should_not be_valid}
  end
end