class StaffMailer < ApplicationMailer
  default from: 'submitted_orders@shop.xyz'

  def order_is_submitted
    @customer = params[:customer]
    @order = params[:order]
    mail(to: 'staff-notifications@shop.xyz', subject: "Order ready for preparation.")
  end
end
