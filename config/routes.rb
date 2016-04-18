Rails.application.routes.draw do
 root to: "users#new"

 resources :users

 namespace :api do
  namespace :v1 do
    resources :links, defaults: {format: :json} do
    end
  end
end


 get '/login', to: 'sessions#new'
 post '/login', to: 'sessions#create'
 delete '/logout', to: 'sessions#destroy'
 resources :links
end
