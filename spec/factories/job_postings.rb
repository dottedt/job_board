FactoryGirl.define do


  factory :job_posting do
    job_experience_id "1"
    job_type_id "2"
    title "MyText"
    relocation true
    remote true
    freelance true
    would_have_done "MyText"
    compensation "MyText"
    nice_to_have "MyText"

    factory :invalid_job_posting do
        job_experience_id nil

    end
  end
end
