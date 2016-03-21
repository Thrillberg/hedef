class ApplicationMailer < ActionMailer::Base
  # require 'mail'
  # require 'letter_opener'

  # helper :application # gives access to all helpers defined within `application_helper`.
  # include Devise::Controllers::UrlHelpers # Optional. eg. `confirmation_url`
  # default template_path: 'devise/mailer' # to make sure that your mailer uses the devise views

  # Mail.defaults do
  #   delivery_method LetterOpener::DeliveryMethod, :location => File.expand_path('../tmp/letter_opener', __FILE__)
  # end

  default from: "me@erictillberg.com"
  layout 'mailer'

  def send_report_request_emails(teams)
    teams.each do |team|
      recipients = []
      team.users.each do |user|
        recipients << user.email
      end
      Mail.deliver do
        # to recipients
        to "eric.tillberg@gmail.com"
        from "me@erictillberg.com"
        subject "Please reply with a report"

        text_part do
          body "Please reply with a report"
        end
      end
    end
  end
end
