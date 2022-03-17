class ChatroomsController < ApplicationController
  def index
    @chatrooms = Chatroom.all
  end

  def new
    @chatroom = Chatroom.new
  end

  def create
    recipient_id = params[:recipient_id]
    recipient = User.find(recipient_id)
    @chatroom = Chatroom.new(name: "Chat with #{recipient.nickname}")
    @chatroom.first_user_id = current_user.id
    @chatroom.second_user_id = recipient.id
    # binding.pry
    if @chatroom.save
      redirect_to chatroom_path(@chatroom.id)
    end
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end
end
