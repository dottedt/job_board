JobBoard::Application.routes.draw do
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}
  root      "job_postings#index"
  resources :companies
  resources :job_postings
  resources :job_experiences
  resources :job_types
  resources :job_skills
end
