class ReceiptMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def receipt_email(order)
    @order = order
    mail(to: @order.email, subject:"Order No. #{order.id} from Jungle")
  end
end

