Rails.application.routes.draw do
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts

  root 'posts#index'

  get 'posts/new' => 'posts#new'

  post 'posts' => 'posts#create'

  get 'posts/:id' => 'posts#show'

  get 'posts/:id/edit' => 'posts#edit'

  put 'posts/:id' => 'posts#update'

  delete 'posts/:id' => 'posts#destroy'

  get '/signup' => 'users#new'

  post '/users' => 'users#create'


  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  get 'users/new'

  get 'users/create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

end

