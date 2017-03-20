class UsersController < ApplicationController

  def index
    @users = User.all
  end
  def new
    @user =  User.new
  end

  def create
    @user = User.new(user_params)
    if
      @user.save
      # send them an email
      UserMailer.signup(@user).deliver
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end



  private

  def user_params
    params.require(:user).permit(:username, :password, :email)
  end

  def find_user
    @user = User.find(params[:id])
  end

end
