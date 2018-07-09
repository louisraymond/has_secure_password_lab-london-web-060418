class UsersController < ApplicationController
  def new
  end

  def create
    @user=User.create(user_params)
    if @user.password == @user.password_confirmation
      session[:user_id]=@user.id
    @user.save
  elsif  @user.password != @user.password_confirmation
      redirect_to '/users/new'
    end
  end
  # creates a new user (FAILED - 4)
  #   logs you in (FAILED - 5)
  #   sets your password if the confirmation matches (FAILED - 6)
  #   redirects you if your password and confirmation don't match (FAILED - 7
private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)

  end
end
