class UsersController < ApplicationController
  before_action :check_current_user

  def new; end

  def create
    if params[:username].present? && params[:dialect].present?
      session[:current_user] = { username: params[:username], dialect: params[:dialect] }
      redirect_to root_path
    else
      flash[:error] = "Please inform your username and choose a dialect"
      redirect_to new_user_path
    end
  end
end
