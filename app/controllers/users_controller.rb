class UsersController < ApplicationController
  
  # before_action :set_user, only: [:show, :edit, :update]
  before_action :set_current_user
  before_action :user_signed_in?, only: [:create, :edit, :new]


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

  def show
    user_id = params[:id]
    @user = User.find(user_id)
  end

  def edit
    @user = User.find(params[:id])
  end


  def update
    @user = User.find(params[:id])

    @user.update(user_params)
    redirect_to action: 'index'
  end


  # ********************ASSIGNMENT 
  # create delete functionality from CRUD
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to action: 'index'
  end

  # sample for creating a done/undone method for a todo app
  # def toggle_status
  #   @task.done=!@task.done
  #   @task.save
  #   re
  # end


  # action to render sign_in page
  def sign_in

  end

  # method to verify the login credentials of a user and add the id to cookies
  def create_session
    # byebug
    user = User.find_by(
        email: params[:email],
        password: params[:password]
      )

    if (user.nil?)
      redirect_to action: "sign_in"
    else
      session[:user_id] = user.id

      redirect_to "/users/#{user.id}"
    end

  end

  # delete the signed in user from cookies
  def sign_out
    if @current_user
      session.delete(:user_id)
      redirect_to action: "index"
    end
  end



  private

  def set_current_user
    byebug
    @current_user = User.find_by(id: session[:user_id])
  end

  def user_signed_in?
    if @current_user.blank?
      redirect_to action: "sign_in"
    end

  end


  def user_params
    params.require(:user).permit(:name, :age, :email, :password)
  end


  # set @user before calling certain actions
  # def set_user
  #   @user = User.find(params[:id])
  # end



end












