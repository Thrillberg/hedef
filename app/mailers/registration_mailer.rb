class RegistrationMailer < ApplicationMailer
  default to: "eric.tillberg@gmail.com"

  def greet_user(user)
    # Mail.deliver do
    #   # to "#{user.email}"
    #   to "eric.tillberg@gmail.com"
    #   from "me@erictillberg.com"
    #   subject "Welcome!"
    #
    #   text_part do
    #     body "Welcome and testing!"
    #   end
    # end
    email = "eric.tillberg@gmail.com"
    mail(to: email, from: 'me@erictillberg.com', subject: "testing")
  end
end
