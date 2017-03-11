class UsersController < ApplicationController
  before_action :check_current_user

  def new; end

  def create
    if params[:username].present? && params[:dialect].present?
      sessions_register
      redirect_to root_path
    else
      flash[:error] = "Please inform your username and choose a dialect"
      redirect_to new_user_path
    end
  end

  def active_users
    @users = session[:active_users]
    respond_to do |format|
      format.js { render layout: false, locals: { users: @users } }
    end
  end

  private
  def sessions_register
    session[:current_user] = { username: params[:username], dialect: params[:dialect] }
    session[:active_users] = session[:active_users].any? ? session[:active_users] : []
    session[:active_users] << { username: params[:username], dialect: params[:dialect] }
  end
end
