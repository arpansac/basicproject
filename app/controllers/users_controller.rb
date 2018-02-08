class UsersController < ApplicationController
  
# Our Convention To Code
# create action
# create route
# create view if required


  # lists all the users
  def index
  	@all_users = User.all
  end

  # renders the page to create a new user
  def new
  	@user = User.new
  end


  # takes data from the form on new.html.erb and creates a new user --> redirects to index
  def create
  	# puts('********')
  	# puts(params)
  	
  	User.create(user_params)

  	redirect_to action: 'index'
  end

  # displays information of a user
  def show
    user_id = params[:id]
    @user = User.find(user_id)
  end

  # renders the page to edit the information of a user
  def edit
    @user = User.find(params[:id])
  end


  # takes data from the form on edit.html.erb and updates the information of the user
  def update
    # byebug
    @user = User.find(params[:id])

    @user.update(user_params)
    redirect_to action: 'index'
  end


  # ********************ASSIGNMENT 
  # create delete functionality from CRUD


  private
  # uptimizes the repeated code written in both create and update
  def user_params
    # it makes sure that params contains a key called :user and then returns all the key-values inside it
    params.require(:user).permit(:name, :age)
  end



end












