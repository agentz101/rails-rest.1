class UsersController < ApplicationController
  def index
    @users = User.all
    rendjer json: @user
  end

  def create
    @user = User.new(user_params)

    if @user.save
        render json: @user, status: :created

    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private


  def user_params
    params.require(:user).permit(:name, :email)
  end
end
