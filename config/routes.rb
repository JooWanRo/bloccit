Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:update]

  resources :topics do
    resources :posts, except: [:index] do
      resources :comments, only: [:create]
    end
  end

  # /welcome/about linked to /about
  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end
