class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]

  # Feed, mostra todos os posts de todos os artistas
  def index
    @posts = Post.all.order("updated_at DESC")
    # @comment = @post.comments.build
  end

  # Perfil, chama os posts de um artista só
  def show
    @comment = @post.comments.build
    @reply = Reply.new
  end

  # Novo post
  def new
    @post = Post.new # needed to instantiate the form_for
  end

  def create
    # no need for app/views/posts/create.html.erb
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path
    else
      render "new"
    end
  end

  def edit
  end

  def update
    # no need for app/views/posts/update.html.erb
    @post.update(post_params)
    redirect_to post_path(@post)
  end

  def destroy
    # no need for app/views/posts/destroy.html.erb
    @post.destroy
    redirect_to posts_path
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:description, :photo)
  end
end
