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
    @chirp = Chirp.create!
    if @chirp.save
      render json: @chirp, serializer: PostSerializer
    else

    end
  end

end
