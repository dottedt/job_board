require 'faker'

FactoryGirl.define do
  factory :company do |f|
    f.name {Faker::Company.name}
    f.address {Faker::Address.street_address + "\n" + Faker::Address.zip_code + " " + Faker::Address.city}
    f.url "http://www.google.com"
    f.show_address true
    f.show_as_customer true

    factory :invalid_company do
      name nil
    end
  end
end