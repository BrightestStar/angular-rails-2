class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :upvote]
  def index
    respond_with Post.includes(:comments, {comments: :user}).all
  end

  def create
    respond_with Post.create!(post_params.merge(user_id: current_user.id))
  end

  def show
    respond_with Post.includes(:comments, {comments: :user}).find(params[:id])
  end

  def upvote
    post = Post.find(params[:id])
    if !post.upvote_user.include?(current_user.id)
      post.upvotes += 1
      post.upvote_user << current_user.id
      post.save!
    end

    respond_with post
  end

  private

  def post_params
    params.require(:post).permit(:link, :title, :upvote_user, upvote_user:[])
  end
end
