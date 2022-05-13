# frozen_string_literal: true

class CommentsController < ApplicationController
  def index
    @comment = Comment.all
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
    @comment = Comment.find_by(id: params[:id])
  end

  def edit
    @comment = Comment.find_by(id: params[:id])
  end

  def update
    @comment = Comment.find_by(id: params[:id])
    @comment.update(comment_params)
    redirect_to comments_path
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    @comment.destroy
    redirect_to comments_path
  end

  protected

  def comment_params
    params.require(:comment).permit(:description, :post_id, :user_id, :image)
  end
end
