class Combo < ApplicationRecord
  has_and_belongs_to_many :order
  has_many :combo_items
  has_many :items, through: :combo_items
end
