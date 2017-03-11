class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def check_current_user
    redirect_to new_user_path unless session[:current_user].present?
  end
end
