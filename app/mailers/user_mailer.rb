class UserMailer < ActionMailer::Base
  default from: "info@darksecrets.com"

  def confirmation_email(user)
    @user = user
    @url = "localhost:3000/users/#{user.id}/confirm"

    mail(to: user.email, subject: "[DarkSecrets] Please confirm your email")
  end

  def reset_email(user, new_pass)
    @user = user
    @new_pass = new_pass

    mail(to: user.email, subject: "[DarkSecrets] Password reset")
  end
end
