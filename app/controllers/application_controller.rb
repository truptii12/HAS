class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def authenticate_user
  if current_user.nil?
    flash[:error] = 'You must be signed in to view that page.'
    redirect_to :root
  end
end
end
