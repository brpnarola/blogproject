class AdminMailer < ApplicationMailer
  default from: 'from@example.com'

  def new_post_email
   @user = params[:User]
   @admin_email = User.find_by(username:'admin')
   @url  = 'http://example.com/login'
   mail(to: @admin_email.email, subject: 'User Create New Post')
 end

end
