class CreateCombos < ActiveRecord::Migration[7.0]
  def change
    create_table :combos do |t|
      t.string :name      # simple name of the Combo

      t.timestamps
    end
  end
end
