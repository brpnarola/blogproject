# frozen_string_literal: true
class PostsController < ApplicationController
  before_action :set_post, only: %w[show update destroy edit approve]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      AdminMailer.with(user: current_user.username).welcome_email.deliver_later
      redirect_to posts_path
      flash[:notice] = "Email Send Successfully"
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  def approve
    @post.update(approval:true)
    redirect_to posts_path
  end

  def approve_all
    @post_ids = params[:post_ids].split(",")
    Post.where(id: @post_ids).update_all(approval:true)
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :category_id, :user_id, :image)
  end

  def set_post
    @post = Post.find_by(id: params[:id])
  end

end
