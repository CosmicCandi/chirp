class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, serializer: UserExpandedSerializer
    else
      render json: { error: @user.errors.full_messages }, status: 400
    end
  end


  private

  def user_params
    params.permit(:username, :first_name, :last_name, :image, :password)
  end

end
