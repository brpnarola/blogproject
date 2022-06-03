# frozen_string_literal: true
class PostsController < ApplicationController
  before_action :set_post, only: %w[show update destroy edit approve]

  ## list posts
  def index
    @posts = Post.all
  end

  ## new post
  def new
    @post = Post.new
  end

  ## create new post
  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      AdminMailer.with(user: current_user.username).admin_recieved_mail.deliver_later
      redirect_to posts_path(@post)
      flash[:notice] = "Email Send Successfully"
    else
      render 'new'
    end
  end

  ## get post
  def show
  end

  ## edit post
  def edit
  end

  ## update post
  def update
    if @post.update(post_params)
      redirect_to posts_path(@post)
    else
      render :edit
    end
  end

  ## delete post
  def destroy
    @post.destroy
    redirect_to posts_path
  end

  ## approve single post
  def approve
    @post.update(approval:true)
    redirect_to posts_path
  end

  ## approve multiple post
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
