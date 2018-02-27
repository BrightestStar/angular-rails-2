class CommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    comment = post.comments.create!(comment_params)

    respond_with post, comment
  end

  def upvote
    comment = Comment.find(params[:id])
    comment.increment!(:upvotes)

    respond_with comment
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
