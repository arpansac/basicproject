Rails.application.routes.draw do


  get 'users/index'
  get 'users/new'
  post '/users/create', as: 'users'
  get "hello_world" => "application#hello_world"

  
end
