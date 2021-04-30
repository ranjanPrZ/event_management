class TokenMailer < ApplicationMailer
  default from: "notifications@example.com"

  def send_token(user, token)
  	@user = user
  	@token = token
    mail(to: @user.email, subject: "Event subscription verification.")
  end
end
