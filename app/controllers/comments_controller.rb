class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: %W[create]

  def create
    @comment = @post.comments.build(comment_params)
    if @comment.save
      flash[:notice] = "コメントしました"
      redirect_back fallback_location: @post
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      flash[:notice] = "コメント削除しました"
      redirect_back fallback_location: @post
    end
  end

  private
  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    tmp = params.require(:comment).permit(:content, :post_id)
    tmp.merge(user_id: current_user.id)
  end
end
