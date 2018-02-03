Rails.application.routes.draw do


  get 'users/index'

  get "hello_world" => "application#hello_world"

  
end
