class UsersController < ApplicationController
  before_action :check_if_user_exists, only: %i[show edit update destroy change_password]
  before_action :check_if_logged_in, only: %i[edit update change_password]
  before_action :check_if_current_user, only: %i[edit update change_password]

  def index
    @users = User.all.page(params[:page]).per(5)
  end

  def show
    # @user is defined in check_if_user_exists method
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.avatar.attach(params[:user][:avatar])
    if @user.save
      log_in @user
      flash[:success] = "Welcome to Foodstagram!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update 
    if @user.update(user_params) && @user.avatar.attach(params[:user][:avatar])
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def change_password
    if @user.update(user_params)
      flash[:success] = "Password updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end
    
  private
  def user_params
    params.require(:user).permit(:username, :email, :password,
    :password_confirmation, :phone_number)
  end

  def check_if_user_exists
    if !User.exists?(params[:id])
      flash[:info] = "User not found"
      redirect_to root_path
      return
    end
    @user = User.find(params[:id])
  end

  def check_if_logged_in
    if !is_logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_path
    end
  end

  def check_if_current_user
    @user = User.find(params[:id])
    redirect_to(root_url) if @user != current_user
  end

end
