class ApplicationMailer < ActionMailer::Base
  default from: ENV["mail_user_name"]
  layout "mailer"
end
