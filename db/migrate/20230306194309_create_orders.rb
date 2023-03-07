class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.boolean :submit    # Whether the order is ready to be filled or not
      t.boolean :ready     # Whether the order is ready for the customer or not
      t.boolean :complete  # Whether the order is complete or not

      t.timestamps         # Standard Rails created_at, updated_at fields
    end
  end
end
