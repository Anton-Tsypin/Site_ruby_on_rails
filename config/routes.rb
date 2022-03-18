Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'posts#index'
  get '/' => 'posts#index'

  get '/users' => 'users#login'
  get '/users/list' => 'users#list'

  get '/users/login' => 'users#login', as: 'login_user'
  get '/users/clear' => 'users#clear'
  get '/users/:id/increase' => 'users#increase', as: 'increase_user'
  get '/users/:id/decrease' => 'users#decrease', as: 'decrease_user'
  post '/users/login' => 'sessions#create'

  get '/posts' => 'posts#index'
  get '/posts/:id' => 'posts#show', as: 'post'

  get '/posts/:id/edit' => 'posts#edit', as: 'edit_post'
  patch '/posts/:id' => 'posts#update'
  put '/posts/:id' => 'posts#update'

  delete '/posts/:id' => 'posts#destroy'
  
  resources :users do
    resources :posts
  end
  
  get '*path', to: 'errors#error_404', via: :all

end
