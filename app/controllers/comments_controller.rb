# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_comment, only: %w[show edit update destroy]
  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_to comments_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to comments_path
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to comments_path
  end

  private

  def comment_params
    params.require(:comment).permit(:description, :post_id, :user_id, :image)
  end

  def set_comment
    @comment = Comment.find_by(id: params[:id])
  end
end
