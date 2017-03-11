class MessagesController < ApplicationController
  before_action :check_current_user
  before_action :get_messages, only: [:index, :create]

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
    message = params[:message][:description]
    translated_message = Translation.new(user["dialect"]).translate(message)
    { description: translated_message, author: user["username"], dialect_type: user["dialect"] }
  end

  def get_messages
    @messages = Message.all
  end
end
