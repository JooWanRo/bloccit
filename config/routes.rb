Rails.application.routes.draw do
  resources :questions
  resources :posts

  # /welcome/about linked to /about
  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end
