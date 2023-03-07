class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name      # simple name of the item in question
      t.integer :price    # the price in cents
      t.integer :discount # for items with a discount, amount of the discount, 0 for no discount, same as :price for free
      t.integer :tax_rate # the tax rate for this item as a percentage, i.e. integer/100 times normal or discounted price

      t.timestamps        # standard Rails created_at, updated_at fields.
    end
  end
end
