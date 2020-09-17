class MessagesController < ApplicationController
  def index
    @message = Message.new
    @room = Room.find(params[:room_id])
    @rooms = Room.all.order(:id)
    @messages = @room.messages
  end

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    if @message.save
    else
      @messages = @room.messages
      render :index
    end
  end
  
  def show
    @messages = Message.all
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
