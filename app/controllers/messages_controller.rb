class MessagesController < ApplicationController
  before_action :check_current_user

  def index
    @message = Message.new
  end
end
