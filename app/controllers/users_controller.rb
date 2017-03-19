class UsersController < ApplicationController

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
      # redirect_to "/users/#{@user.id}"
      # redirect_to controller: "users", action: "show", id: @user.id

      # url_for(@user)
      #   - Check class name (User)
      #   - "#{class_name}_path(id: thing.id)"
    else
      render :new
    end
  end



  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

  def find_user
    @user = find(params[:id])
  end

end
