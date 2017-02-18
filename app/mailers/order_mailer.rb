class OrderMailer < ApplicationMailer
  def confirmation(order)
    @order = order
    mail_subject = "Order Confirmation for #{@order.name}"
    p '*' * 80
    p ENV["GMAIL_USERNAME"]
    p '*' * 80
    mail(to: @order.email, subject: mail_subject)
  end
end
