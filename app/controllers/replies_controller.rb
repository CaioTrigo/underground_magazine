class RepliesController < ApplicationController
  def create
    @comment = Comment.find(params[:comment_id])
    @reply = Reply.new(reply_param)
    @reply.comment = @comment
    @reply.user = current_user
    @reply.save
    respond_to do |format|
      format.json { render json: { reply: @reply, nickname: current_user.nickname } }
    end
  end

  private

  def reply_param
    params.require(:reply).permit(:text)
  end
end
