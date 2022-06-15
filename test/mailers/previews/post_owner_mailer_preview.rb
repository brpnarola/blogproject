# Preview all emails at http://localhost:3000/rails/mailers/post_owner_mailer
class PostOwnerMailerPreview < ActionMailer::Preview
  def postowner_recieved_mail_post_delete
    PostOwnerMailer.with(user: User.last.email).postowner_recieved_mail_post_delete
  end
end
