class ApplicationMailer < ActionMailer::Base
  default from: "orders@theaters.com"
  layout 'mailer'
end
