class PostOwnerMailer < ApplicationMailer
  default from: 'from@example.com'

  def postowner_recieved_mail_post_delete
    @user =  params[:user]
    @username = @user.username
    @user_email = @user.email
    if params[:login_user].username == "admin"
     mail(to: @user_email, subject: "Your Post Soft Deleted By Admin")
    end
  end

  def postowner_recieved_mail_post_restore
    @user =  params[:user]
    @username = @user.username
    @user_email = @user.email
    if params[:login_user].username == "admin"
     mail(to: @user_email, subject: "Your Post Restore By Admin")
    end
  end

  def postowner_recieved_mail_post_permanent_delete
    @user =  params[:user]
    @username = @user.username
    @user_email = @user.email
    if params[:login_user].username == "admin"
     mail(to: @user_email, subject: "Your Post was Permanent Deleted By Admin")
    end
  end
end
