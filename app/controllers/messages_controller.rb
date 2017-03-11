class MessagesController < ApplicationController
  before_action :check_current_user

  def new; end

  def index
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    unless @message.save
      flash.now[:error] = @message.errors.full_messages
    end

    render :index
  end

  private
  def message_params
    user = session[:current_user]
    { description: params[:message][:description], author: user["username"], dialect_type: user["dialect"] }
  end
end
