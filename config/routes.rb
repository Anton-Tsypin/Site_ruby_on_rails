Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/' => 'users#index'
  

  get '/users' => 'users#index'
  get '/list' => 'users#list'
  post '/sessions' => 'sessions#create'

  resources :users
  
  get '*path', to: 'errors#error_404', via: :all



  
 #get '/' => 'users#index'
  #post '/sessions' => 'sessions#create'
  #post '/users' => 'users#create'
  #resources :users
  #get '*path', to: 'errors#error_404', via: :all

end
