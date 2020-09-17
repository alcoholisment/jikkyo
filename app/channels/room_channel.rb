class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel" 
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    Message.create! content: data['message'], room_id: data['room_id']
  end
end

