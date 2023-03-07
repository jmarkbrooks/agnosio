class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :name  # The full customer name, whatever that is.
      t.string :email # The customer email address so they can be notified of their order.

      t.timestamps    # Standard Rails created_at, updated_at
    end
  end
end
