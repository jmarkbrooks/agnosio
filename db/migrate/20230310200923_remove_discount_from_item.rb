class RemoveDiscountFromItem < ActiveRecord::Migration[7.0]
  def change
    remove_column :items, :discount
  end
end
