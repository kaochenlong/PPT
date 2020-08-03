class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  before_action :find_user

  private
  def find_user
    if session[:user_token]
      @current_user = User.find(session[:user_token])
    end
  end

  def not_found
    render file: '/public/404.html', status: 404
  end
end
