class Order < ApplicationRecord
  has_and_belongs_to_many :item
  belongs_to :customer
  after_update :notify_staff, if: :order_is_submitted?
  after_update :notify_customer, if: :order_is_ready?

  def total
    before_roundup = self.item.reduce(0.0) do |sum, line|
      if self.item.count > 1
        base = line.price - line.discount
      else
        base = line.price
      end
      tax = base * (line.tax_rate.to_f/100)
      subtotal = base + tax
      sum + subtotal         
    end 
    before_roundup.ceil
  end

  private

  def notify_customer
    logger.info "Ready for pickup email sent to customer!"
    CustomerMailer.with(customer: self.customer, order: self).order_is_ready.deliver_later
  end

  def notify_staff
    logger.info  "Staff notified to fill order!"
    StaffMailer.with(customer: self.customer, order: self).order_is_submitted.deliver_later
  end

  def order_is_ready?
    self.complete ? false : self.ready
  end

  def order_is_submitted?
    (self.ready || self.complete) ? false : self.submit
  end
end
