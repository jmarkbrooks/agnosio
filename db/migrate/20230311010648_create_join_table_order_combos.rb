class CreateJoinTableOrderCombos < ActiveRecord::Migration[7.0]
  def change
  end
    create_join_table :orders, :combos do |t|
      t.index [:order_id, :combo_id]
      t.index [:combo_id, :order_id]
    end
end
