class UsersController < ApplicationController
  
  def index
  	@all_users = User.all
  end

  def new
  	@user = User.new
  end

  def create
  	# puts('********')
  	# puts(params)
  	
  	User.create(
  			name: params[:user][:name],
  			age: params[:user][:age],
  			email: params[:user][:email],
  			password: params[:user][:password],
  		)

  	redirect_to action: 'index'
  end



end
