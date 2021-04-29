class TokenMailer < ApplicationMailer
  default from: "notifications@example.com"

  def send_token(user, token)
  	@user = user
    mail(to: @user.email, subject: "Your token. #{token}")
  end
end
