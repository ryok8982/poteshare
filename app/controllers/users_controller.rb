class UsersController < ApplicationController
  
  before_action :authenticate_user!, expect: [:index]
  def index
    @users = User.all
    @name = current_user.username
  end

  def show
    @user = User.find(params[:id])
    @name = current_user.username
  end

  def edit
    @user = User.find(params[:id])
    @name = current_user.username
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
    @name = current_user.username
  end
  
  private
  def user_params
    params.require(:user).permit(:username, :email, :profile, :profile_image)
  end
end
