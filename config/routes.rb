Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'posts#index'
  get '/' => 'posts#index'

  get '/users' => 'users#login'
  get '/users/list' => 'users#list'

  get '/users/login' => 'users#login'
  post '/users/login' => 'sessions#create'

  get '/posts' => 'posts#index'
  get '/posts/:id' => 'posts#show', as: 'post'
  delete '/posts/:id' => 'posts#destroy'
  
  resources :users do
    resources :posts
  end
  
  get '*path', to: 'errors#error_404', via: :all

end
