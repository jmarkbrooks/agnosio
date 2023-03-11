class Order < ApplicationRecord
  has_and_belongs_to_many :item
  belongs_to :customer
  has_and_belongs_to_many :combo
  after_update :notify_staff, if: :order_is_submitted?
  after_update :notify_customer, if: :order_is_ready?

  def total
    item_total(self.item) + combos_total
  end

  private

  def item_total(items)
    before_roundup = items.reduce(0.0) do |sum, line|
      base = defined?(line.price) ? line.price : line.combo_price
      rate = defined?(line.tax_rate) ? line.tax_rate : line.item.tax_rate
      tax = base * (rate.to_f/100)
      subtotal = base + tax
      sum + subtotal         
    end
    before_roundup.ceil
  end

  def combos_total
    before_roundup = self.combo.reduce(0.0) do |combos_sum, combo|
      combos_sum + item_total(combo.combo_items)      
    end
    before_roundup.ceil
  end

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
