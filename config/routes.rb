Rails.application.routes.draw do
  
  # resources generates all the routes for CRUD in just one line
  # try rake routes in the terminal to see
  resources :posts

  get 'users/sign_in', as: "user_sign_in"
  post 'users/create_session', as: "user_create_session"
  delete 'users/sign_out', as: "user_sign_out"


  get 'users/index'
  get 'users/new'
  get 'users/:id' => "users#show"
  delete 'users/:id' => "users#destroy", as: "user_destroy"
  get 'users/:id/edit' => "users#edit", as: "user_edit"
  patch 'users/:id/update' => "users#update", as: "user"

  # name given to access route by name_path
  # by giving a name to the route, we can just change the route (not the name) in routes.rb instead of changing the route in every file where it is used
  post '/users/create', as: 'users'


  # get "hello_world" => "application#hello_world"


  # different ways of creating a route and mapping it to a controller
  get "application/hello_world"
   get "abc" => "application#hello_world"  


   root "users#index"
  
end







