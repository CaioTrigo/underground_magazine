class ChatroomsController < ApplicationController
  def index
    @chatrooms = Chatroom.where(["first_user_id = :first or second_user_id = :second", { first: current_user, second: current_user }])
  end

  def new; end

  def create
    recipient_id = params[:recipient_id]
    recipient = User.find(recipient_id)
    @chatroom = Chatroom.new(name: "Chat with #{recipient.nickname}")
    @chatroom.first_user = current_user
    @chatroom.second_user = recipient
    if @chatroom.save
      redirect_to chatroom_path(@chatroom)
    end
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end
end
