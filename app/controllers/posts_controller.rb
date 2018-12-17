class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    current_user.posts.build(post_params)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    current_user.posts.update(post_params)
    redirect_to post_path(@post.id)
  end

  private

  def post_params
    params.require(:post).permit(:name, :title, :body)
  end
end
