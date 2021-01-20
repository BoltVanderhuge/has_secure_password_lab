class UsersController < ApplicationController
  before_action :set_user, only: [:show]
 
  def show
  end

  def new
    @user = user.new
  end

  # def create
  #   @user= User.create(user_params(:username, :password, :password_confirmation))
  #   if @user.valid?
  #     redirect_to user_path(@user)
  #   else
  #     flash[:messages] = @user.errors.full_messages
  #     redirect_to new_user_path
  #   end
  # end
  def create
    @user = User.create(user_params)
    return redirect_to controller: 'users', action: 'new' unless @user.save
    session[:user_id] = @user.id
    redirect_to controller: 'welcome', action: 'home'
  end

  private
  def set_user
    @user= User.find(params[:id])
  end

  # def user_params(*args)
  #   params.require(:user).permit(*args)
  # end

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
