class OrderMailer < ApplicationMailer
  def confirmation(order)
    @order = order
    mail_subject = "Order Confirmation for #{@order.name}"
    mail(to: @order.email, subject: mail_subject)
  end
end
