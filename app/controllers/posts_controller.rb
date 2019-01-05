class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post, only: %W[show, edit, update, destroy]

  def new
    @post = Post.new
  end

  def index
    @posts = Post.includes(:tags).page(params[:page]).latest_posts
  end

  def show
    @comment = Comment.new
    @comments = set_post.comments
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path
      flash[:notice] = "投稿しました"
    else
      redirect_to new_post_path, flash: {
        post: @post,
        error_messages: @post.errors.full_messages
      }
    end
  end

  def edit
    set_post
  end

  def update
    if set_post.update(post_params)
      flash[:notice] = "投稿が更新されました"
      redirect_to post_path(@post.id)
    else
      redirect_to posts_path
    end
  end

  def destroy
    if set_post.delete
      flash[:notice] = "投稿が削除されました"
      redirect_to posts_path
    else
      redirect_to posts_path
    end
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :budget, :tag_list, :image, :remove_image)
  end
end
