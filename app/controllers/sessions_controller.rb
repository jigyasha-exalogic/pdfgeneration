class SessionsController < ApplicationController
  def index
  end

  def create
    @error1
    @user = User.find_by_email(userparams[:email])
    if @user && @user.authenticate(userparams[:password]) && @user.role == "admin"
      session[:user_type] = 'admin'
      redirect_to '/users'
    elsif @user && @user.authenticate(userparams[:password])
      session[:user_type] = 'user'
      redirect_to @user
    else
      @error1="Invalid credentials"
      render 'index'
    end
  end

  def destroy
      session[:user_type] = nil
      redirect_to root_path
  end
  private

  def userparams
    params.require(:user).permit(:email,:password)
  end
end
