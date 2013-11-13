FactoryGirl.define do
  factory :job_type do
    name "MyString"
    skills "MyString"

    factory :invalid_job_type do
      name nil
    end
  end
end
