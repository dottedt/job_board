FactoryGirl.define do
  factory :job_skill do
    name "MyString"
    version "MyString"

    factory :invalid_job_skill do
      name nil

    end
  end
end

