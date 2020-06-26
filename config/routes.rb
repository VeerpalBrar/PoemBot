Rails.application.routes.draw do
  use_doorkeeper
  devise_for :users
  
  namespace :api do
    namespace :v1 do
      resources :poems
    end
  end
  
  resources :poems do
    member do
      post 'upvote'
      get 'upvote_count'
    end
  end
  
  get '/poems/fetch_page/:id', to: 'poems#fetch_page'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'poems#index'

end
