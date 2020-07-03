Rails.application.routes.draw do
  use_doorkeeper
  devise_for :users
  
  namespace :api do
    namespace :v1 do
      resources :poems
    end
  end

  get '/poems/search', to: 'poems#search'
 
  resources :poems do
    member do
      post 'upvote'
      get 'upvote_count'
    end
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'poems#index'

end
