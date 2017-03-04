class UsersController < ApplicationController


  def index
    @users = User.all
    render json: @users, status: 200
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, serializer: UserExpandedSerializer
    else
      render json: { error: @user.errors.full_messages }, status: 400
    end
  end

  # def follow
  #   @user = current_user
  #   target_user = User.find_by(params[:username])
  #   if current_user.follows?(target_user)
  #   else
  #     render json: {""}
  #   end
  # end

  def unfollow
  end

  private

  def user_params
    params.permit(:username, :first_name, :last_name, :image, :password, :password_confirmation)
  end

end
