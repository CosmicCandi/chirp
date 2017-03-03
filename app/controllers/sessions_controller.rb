class SessionsController < ApplicationController

  def login
    @user = User.find_by(username: params[:username])&.
              authenticate(params[:password])
    if @user
      render json: @user, serializer: UserExpandedSerializer
    else
      render json: ["You must be signed in to view this page."], status: 401
    end
  end

end
