class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params.merge(user: current_user, room_id: params[:id]))
    render :new, status: :unprocessable_entity unless @message.save
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end
