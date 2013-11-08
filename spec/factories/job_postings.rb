FactoryGirl.define do
  factory :job_posting do
    experience "1"
    category "2"
    title "MyText"
    relocation true
    remote true
    freelance true
    would_have_done "MyText"
    compensation "MyText"
    nice_to_have "MyText"

    factory :invalid_job_posting do
        experience nil

    end
  end
end
