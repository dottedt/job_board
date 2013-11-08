# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :job_posting do
    experience 1
    type 1
    category ""
    title "MyText"
    relocation false
    remote false
    freelance false
    would_have_done "MyText"
    compensation "MyText"
    nice_to_have "MyText"
  end
end
