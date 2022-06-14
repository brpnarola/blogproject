# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_comment, only: %w[destroy edit update destroy]

  ## list comments
  def index
    @comments = Comment.all.order(:id)
  end

  ## new comment
  def new
    @comment = Comment.new
  end

  ## create new comment
  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_to post_path(params[:post_id])
    else
      redirect_to post_path(params[:post_id])
    end
  end

  ## edit comment
  def edit
  end

  ## update comment
  def update
    if @comment.update(comment_params)
      redirect_to post_path(params[:post_id])
    else
      render :edit
    end
  end

  ## delete comment
  def destroy
    @comment.destroy
    redirect_to post_path(params[:post_id])
  end


  private

  def comment_params
    params.require(:comment).permit(:description, :post_id, :user_id, :image)
  end

  def set_comment
    @comment = Comment.find_by(id: params[:id])
  end

end
