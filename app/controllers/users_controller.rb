class UsersController < ApplicationController
  before_action :set_user, only: [:follow, :unfollow]

  def index
    @users = User.where.not(id: current_user.id)
  end

  def follow
    if current_user.follow(@user.id)
      create_chatroom(@user)
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    end
  end

  def unfollow
    if current_user.unfollow(@user.id)
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js { render action: :follow }
      end
    end
  end

  def followers
    @followers = current_user.followers
  end

  def following
    @following = current_user.following
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def create_chatroom(followee)
    @chatroom = Chatroom.new(name: "Chat #{followee.nickname} and #{current_user.nickname}")
    @chatroom.first_user_id = current_user.id
    @chatroom.second_user_id = followee.id
    @chatroom.save
  end
end
