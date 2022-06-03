# Preview all emails at http://localhost:3000/rails/mailers/admin_mailer
class AdminMailerPreview < ActionMailer::Preview
  def admin_recieved_mail
    AdminMailer.with(user: User.last).admin_recieved_mail
  end
end
