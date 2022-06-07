class UsersController < ApplicationController
  before_action :set_user_id, only: %w[show edit destroy]
  skip_before_action :verify_authenticity_token, only: [:set_role_admin, :destroy_multiple]
  #before_action :check_parameters callbacks

  def index
    @users = User.all
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  def set_role_admin
    if params[:user_roles].blank?
      redirect_to users_path, alert: "Select Proper Checkbox First!"
    else
      @users = params[:user_roles].split(",")
      User.where(id: @users).update_all(role:0)
      redirect_to users_path
    end
  end

  def destroy_multiple
    if params[:user_data].blank?
      redirect_to users_path, alert: "Select Proper Checkbox First!", class: "alert alert-info"
    else
      @users = params[:user_data].split(",")
      User.where(id: @users).destroy_all
      redirect_to users_path
    end
  end

  private
  def set_user_id
    @user = User.find_by(id: params[:id])
  end

end
