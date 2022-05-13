class ApplicationMailer < ActionMailer::Base
  default from: ENV["host"]
  layout "mailer"
end
