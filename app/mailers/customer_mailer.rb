class CustomerMailer < ApplicationMailer
  default from: 'your-order-is-ready@shop.xyz'

  def order_is_ready
    @customer = params[:customer]
    @order = params[:order]
    mail(to: @customer.email, subject: "Your order is ready.")
  end
end
