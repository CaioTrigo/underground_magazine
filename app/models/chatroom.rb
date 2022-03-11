class Chatroom < ApplicationRecord
  has_many :messages
end

class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    chatroom = Chatroom.find(params[:id])
    stream_for chatroom
  end
end
