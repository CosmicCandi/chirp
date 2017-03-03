class PostsController < ApplicationController

  def index
    if current_user
      @chirps = Post.timeline(current_user)
    else
        @chirps = Post.order("created_at DESC")
    end
    render json: @chirps, scope: current_user, scope_name: :current_user
  end

  def create
    @chirp = Post.new(chirp_params)
    current_user.posts << @chirp
    if @chirp.save
      render json: @chirp
    else
      render json: { error: @user.errors.full_messages }, status: 400
    end
  end

  private
  def chirp_params
    params.permit(:body)
  end

end
