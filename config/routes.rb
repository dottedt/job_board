JobBoard::Application.routes.draw do
  resources :companies
  resources :job_postings
  resources :job_experiences
end
