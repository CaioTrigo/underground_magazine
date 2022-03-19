class UsersController < ApplicationController
  before_action :set_user, only: [:follow, :unfollow, :show]

  def index
    @users = User.where.not(id: current_user.id)
  end

  def show
    @posts = Post.from_certain_user(@user.id)
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
    @users = current_user.followers
  end

  def following
    @users = current_user.following
  end

  private

  def set_current_user
    @current_user
  end

  def set_user
    @user = User.find(params[:id])
  end

  def create_chatroom(follower)
    if Chatroom.where(['first_user_id = :first and second_user_id = :second', {first: follower, second: current_user }]).empty?
      @chatroom = Chatroom.new(name: "Chat with #{follower.nickname} and #{current_user.nickname}")
      @chatroom.first_user = current_user
      @chatroom.second_user = follower

      @chatroom.save
    end
  end
end
