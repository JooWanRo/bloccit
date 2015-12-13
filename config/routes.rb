Rails.application.routes.draw do

  devise_for :users

  resources :topics do
    resources :posts, except: [:index]
  end

  # /welcome/about linked to /about
  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end
