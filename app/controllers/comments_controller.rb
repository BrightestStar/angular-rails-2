class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :upvote]
  def create
    post = Post.find(params[:post_id])
    comment = post.comments.create!(comment_params.merge(user_id: current_user.id))

    respond_with post, comment
  end

  def upvote
    post = Post.find(params[:post_id])
    comment = post.comments.find(params[:id])
    if !comment.upvote_user.include?(current_user.id)
      comment.upvote_user << current_user.id
      comment.upvotes += 1
      comment.save!
    end

    respond_with post, comment
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
