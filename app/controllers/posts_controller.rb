# frozen_string_literal: true
class PostsController < ApplicationController
  before_action :set_post, only: %w[show update destroy edit approve soft_delete restore]
  skip_before_action :verify_authenticity_token, only: [:approve_all]

  ## list posts
  def index
    if current_user.role == "admin"
     @posts = Post.all.order(:id)
   else
     @posts = Post.where(user_id:current_user.id)
   end
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
    @comments = @post.comments
    @comment = @post.comments.new
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
    redirect_to soft_delete_post_data_posts_path
  end

  ## approve single post
  def approve
    @post.update(approval:true)
    redirect_to posts_path
  end

  ## approve multiple post
  def approve_all
    if params[:post_ids].blank?
      redirect_to posts_path, alert: "Select Proper Checkbox First!"
    else
      @post_ids = params[:post_ids].split(",")
      Post.where(id: @post_ids).update_all(approval:true)
      redirect_to posts_path
    end
  end

  ## change post_delete_status for soft delete
  def soft_delete
    @post.update(post_delete_status:true)
    redirect_to posts_path
  end

  ## list all soft delete data in post table
  def soft_delete_post_data
    if current_user.role == 'admin'
      @posts = Post.where(post_delete_status:true)
    else
      @user_id = current_user.id
      @posts = Post.where(post_delete_status:true).where(user_id: @user_id)
    end
  end

  ## restore soft delete data from post table
  def restore
    @post.update(post_delete_status:false)
    redirect_to soft_delete_post_data_posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :category_id, :user_id, :image)
  end

  def set_post
    @post = Post.find_by(id: params[:id])
  end

end
