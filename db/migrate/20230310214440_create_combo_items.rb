class CreateComboItems < ActiveRecord::Migration[7.0]
  def change
    create_table :combo_items do |t|
      t.integer :combo_price
      t.references :item, null: false, foreign_key: true
      t.references :combo, null: false, foreign_key: true

      t.timestamps
    end
  end
end
