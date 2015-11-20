Rails.application.routes.draw do
  resources :advertisements
  resources :posts

  # /welcome/about linked to /about
  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end
