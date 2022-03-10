class PostsController < ApplicationController

  # Feed, mostra todos os posts de todos os artistas
  def index
    @posts = Posts.all
  end

  # Perfil, chama os posts de um artista só
  def show
    @post = Post.find(params[:id])
  end

  # Novo post
  def new
    @post = Post.new # needed to instantiate the form_for
  end
end
