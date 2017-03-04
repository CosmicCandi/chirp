class SessionsController < ApplicationController

  def login
    @user = User.find_by(username: params[:username])&.
              authenticate(params[:password])
    if @user
      render json: @user, serializer: UserExpandedSerializer
    else
      render json: ["Username or password incorrect. Please verify your details and try again."], status: 401
    end
  end

  def signout
    render json: ["You have been logged out."], status: 200
  end

end
