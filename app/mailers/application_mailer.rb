class ApplicationMailer < ActionMailer::Base
  default from: ENV['SMTP_DEFAULT_MAILER']
  layout 'mailer'
end
