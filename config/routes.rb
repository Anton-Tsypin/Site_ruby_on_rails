Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "users#index"
  get '/' => 'users#index'
  
  resources :users

  get '/users' => 'users#index'
  get '/list' => 'users#list'
  post '/sessions' => 'sessions#create'

  get '*path', to: 'errors#error_404', via: :all
end
