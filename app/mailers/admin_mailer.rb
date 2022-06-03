class AdminMailer < ApplicationMailer
  default from: 'from@example.com'

  def admin_recieved_mail
    @user = User.last
    @admin = User.find_by(username:'admin')
    mail(to: @admin.email, subject: 'User Create New Post')
  end
end
