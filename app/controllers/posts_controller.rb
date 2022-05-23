# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: %w[show edit update destroy approve]

  ## List all post
  def index
    @post = Post.all
  end

  ## get post
  def show
  end

  # edit post
  def edit
  end

  ## New Post
  def new
    @post = Post.new
  end

  ## create new post
  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      AdminMailer.with(Admin: @admin_email).new_post_email.deliver_later
      redirect_to posts_path
      flash[:notice] = "Email Send Successfully"
    else
      render 'new'
    end
  end

  ## update post
  def update
    @post.update(post_params)
    redirect_to posts_path
  end

  ## delete post
  def destroy
    @post.destroy
    redirect_to posts_path
  end

  def approve
    puts @post
    @post.update(post_status: true)
  end

  def approve_all_post
    puts "Array"
    puts @checkbox_ids.length
  end

  protected
  def post_params
    params.require(:post).permit(:title, :description, :category_id, :user_id, :image,:post_status)
  end

  def set_post
    @post = Post.find_by(id: params[:id])
  end

end
