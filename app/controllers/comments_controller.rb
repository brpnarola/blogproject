# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_comment, only: %w[show edit update delete]

  ## list all comments
  def index
    @comment = Comment.all
  end

  ## get comment
  def show
  end

  ## edit comment
  def edit
  end

  ## new comment
  def new
    @comment = Comment.new
  end

  ## create comment
  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_to comments_path
    else
      render 'new'
    end
  end

  ## update comment
  def update
    if @comment.update(comment_params)
      redirect_to comments_path
    else
      render :edit
    end
  end

  ## delete comment
  def destroy
    @comment.destroy
    redirect_to comments_path
  end

  protected

  def comment_params
    params.require(:comment).permit(:description, :post_id, :user_id, :image)
  end

  def set_comment
    @comment = Comment.find_by(id: params[:id])
  end
end
