class ApplicationController < ActionController::API

  private
    def current_user
      @current_user ||= User.find_by(token: params[:token]) if params[:token]
    end

end
