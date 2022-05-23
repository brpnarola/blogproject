# Preview all emails at http://localhost:3000/rails/mailers/admin_mailer
class AdminMailerPreview < ActionMailer::Preview

  def new_post_email
    AdminMailer.with(admin: User.find_by(username:'admin')).new_post_email
  end

end
