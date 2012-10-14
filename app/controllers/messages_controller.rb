class MessagesController < ApplicationController
  layout false

  def index
    @messages = []

    current_user.messages.where(sent: nil).each do |message|
      @messages << message
      message.update_attributes sent: true
    end
  end

  def create
    @message = current_user.messages.create(params[:message])
    render partial: @message
  end
end
