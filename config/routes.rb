Rails.application.routes.draw do
  devise_for :users
  resources :posts

  # /welcome/about linked to /about
  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end
