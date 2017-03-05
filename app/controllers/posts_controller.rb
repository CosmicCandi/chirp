class PostsController < ApplicationController

  before_action :require_user

  def paginate
    #Pseudo Code for Pagination
    @chirps = Post.timeline(paginate_params, current_user)
    paginate = nil
    unless paginate == nil
      render json: @chirps
    else
      until @chirps.count / params[:limit] <= 0 do
        @chirps.collect limit(params[:limit])

      end
    # Start the rendering of the pagination
    #  Get the limit from the user
    #    @limit = params[:limit]
    #  Get the offset from the user
    #    @offset = params[:offset]
    #  Run calculations for offset by page
    #  @offset = (params[:page] - 1 * params[:offset])
    #  render json: pagination

    @chirps = Post.timeline(paginate_params, current_user)
    @chirps.count
    @offset = (params[:page] - 1) * params[:offset]

    render json: @chirps
    @chirps.limit(params[:offset])


  end

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
      render json: [ error: @chirp.errors.full_messages ], status: 400
    end
  end

  private
  def chirp_params
    params.permit(:body)
  end

  def paginate_params
    params.permit(:pagination,:page, :offset, :limit)
  end

end
