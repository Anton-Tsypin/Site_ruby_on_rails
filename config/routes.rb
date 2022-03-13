Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'users#index'
  get '/' => 'users#index'

  get '/users' => 'users#index'
  get '/users/list' => 'users#list'
  post '/sessions' => 'sessions#create'
  
  resources :users do
    resources :posts
  end
  
  get '*path', to: 'errors#error_404', via: :all

end
