class AdminMailer < ApplicationMailer
  default from: 'from@example.com'

  def admin_recieved_mail
    @user =  params[:user]
    @username = @user.username
    @admin = User.find_by(username:"admin")
    @admin_email = @admin.email
    @post_title = Post.last.title
    mail(to: @admin_email, subject: "User Create New Post")
  end
end
