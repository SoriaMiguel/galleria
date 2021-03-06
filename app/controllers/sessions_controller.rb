class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
      if @user && @user.authenticate(params[:session][:password])
        session[:user_id] = @user.id
        flash[:success] = "Hey there, #{@user.username}"
        redirect_to @user
      else
        flash[:danger] = "You entered the wrong username and/or password.  Please try again."
        redirect_to login_path
      end
  end

  def destroy
    session[:user_id] = nil
    redirect_to :root
  end
end
