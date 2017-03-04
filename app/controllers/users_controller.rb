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

  def follow
    target_user = User.find_by(username: params[:username])
    unless current_user.follows?(target_user)
      current_user.follow!(target_user)
      render json: { message: "#{target_user.username} has been followed.", status: 200 }
    else
      render json: { message: "#{current_user.username} is already following #{target_user.username}.", status: 200 }
    end
  end

  def unfollow
    target_user = User.find_by(username: params[:username])
    if current_user.follows?(target_user)
      current_user.unfollow!(target_user)
      render json: { message: "#{target_user.username} has been unfollowed.", status: 200 }
    else
      render json: { message: "#{current_user.username} is not following #{target_user.username}.", status: 200 }
    end
  end

  private

  def user_params
    params.permit(:username, :first_name, :last_name, :image, :password, :password_confirmation)
  end
end
