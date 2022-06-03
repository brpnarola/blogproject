class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def set_role_admin
    puts "Admin Called"
    @user_ids = params[:user_ids].split(",")
    User.where(id: @user_ids).update_all(role:0)
    redirect_to users_path
  end
end
