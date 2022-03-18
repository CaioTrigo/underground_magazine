class LikesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    like = Like.new
    like.user = current_user
    like.post = post
    like.save!
    redirect_to posts_path(anchor: "post-#{post.id}")
  end
  
  def destroy
    post = Post.find(params[:id].to_i)
    like = post.likes.where(user_id:current_user.id)
    like.first.destroy
    redirect_to posts_path(anchor: "post-#{post.id}")
  end
end
