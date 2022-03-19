class ChatroomsController < ApplicationController
  def index
    @chatrooms = Chatroom.where(["first_user_id = :first or second_user_id = :second", { first: current_user, second: current_user }])
  end

  def show
    @chatrooms = Chatroom.where("first_user_id=? OR second_user_id=?", current_user.id, current_user.id)
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end
end
