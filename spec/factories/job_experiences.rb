FactoryGirl.define do
  factory :job_experience do
    name "MyText"

    factory :invalid_job_experience do
          name nil
    end
  end
end
