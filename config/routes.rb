Rails.application.routes.draw do

  get 'summaries/index'

  get 'summaries/new'

  get 'summaries/show'

  get 'summaries/edit'

  devise_for :users

  resources :topics do
    resources :posts, except: [:index]
  end

  resources :summaries do
    resources :posts, except: [:index]
  end

  # /welcome/about linked to /about
  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end
