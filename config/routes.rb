Rails.application.routes.draw do
  resources :poems do
    member do
      post 'upvote'
      get 'upvote_count'
    end
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'poems#index'
  get 'hello_world', to: 'hello_world#index'

end
