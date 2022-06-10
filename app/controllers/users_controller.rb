class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user_id, only: %w[show edit destroy user_status_active soft_delete restore]
  skip_before_action :verify_authenticity_token, only: [:set_role_admin, :destroy_multiple]
  #before_action :check_parameters callbacks

  # list all users
  def index
   if current_user.role == "admin"
    @users = User.all
   else
    flash[:alert] = "You are not Authorized User!"
    redirect_to root_path
   end
  end

  # delete single user
  def destroy
    @user.destroy
    redirect_to soft_deleted_data_users_path
  end

  # change user role to admin
  def set_role_admin
    if params[:user_ids1].blank?
      redirect_to users_path, alert: "Select Proper Checkbox First!"
    else
      @users = params[:user_ids1].split(",")
      User.where(id: @users).update_all(role:0)
      redirect_to users_path
    end
  end

  # destroy multiple user
  def destroy_multiple
    if params[:user_ids].blank?
      redirect_to users_path, alert: "Select Proper Checkbox First!", class: "alert alert-info"
    else
      @users = params[:user_ids].split(",")
      User.where(id: @users).destroy_all
      redirect_to users_path
    end
  end

  # change user status to active
  def user_status_active
    @user.update(user_status:1)
    redirect_to users_path
  end

  # soft delete functionality run delete_status set true
  def soft_delete
    @user.update(delete_status:1)
    redirect_to users_path
  end

  # list all soft delete user data
  def soft_deleted_data
    @users = User.where(delete_status:1)
  end

  # soft delete functionality run restore user using delete_status = false
  def restore
    @user.update(delete_status:0)
    redirect_to soft_deleted_data_users_path
  end

  private
  def set_user_id
    @user = User.find_by(id: params[:id])
  end

end
