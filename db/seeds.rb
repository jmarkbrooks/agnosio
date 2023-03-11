p "First, create some sample Customers..."
Customer.create!([
  { name: "Mark Brooks", email: "mark.brooks@example.com" },
  { name: "Marlon Brando", email: "mbrando@xyz.abc" },
  { name: "Fancy Pants", email: "abcefg@lmnop.qrs" },
  { name: "Lol Catz", email: "dancing@hampsters.com" },
  { name: "Sleepy Joe", email: "us_president@whitehouse.com" } 
])

p "Second, create some sample Items..."

Item.create!([
  { name: "Coffee", price: 200, tax_rate: 6 },
  { name: "Pepsi", price: 200, tax_rate: 6 },
  { name: "Sandwich", price: 400, tax_rate: 6 },
  { name: "Small soda", price: 100, tax_rate: 6 },
  { name: "Medium soda", price: 200, tax_rate: 6 },
  { name: "Large soda", price: 300, tax_rate: 6 },
  { name: "Burger", price: 350, tax_rate: 6 },
  { name: "French fries", price: 100, tax_rate: 6 },
  { name: "Braised snails", price: 1000, tax_rate: 10 },
  { name: "Rat on a stick", price: 500, tax_rate: 6 },
  { name: "Magic beans", price: 200, tax_rate: 20 }
])

it1  =  Item.find_by(name: "Small soda")
it2  =  Item.find_by(name: "Medium soda")
it3  =  Item.find_by(name: "Large soda")
it4  =  Item.find_by(name: "Burger")
it5  =  Item.find_by(name: "French fries")
it6  =  Item.find_by(name: "Braised snails")
it7  =  Item.find_by(name: "Rat on a stick")
it8  =  Item.find_by(name: "Magic beans")
it9  =  Item.find_by(name: "Coffee")
it10 =  Item.find_by(name: "Pepsi")
it11 =  Item.find_by(name: "Sandwich")

# change set 1
# Let's create some Combos
com1 = Combo.create!(name: "Coffee + Burger")
ComboItem.create!(combo: com1, item: it9, combo_price: 180)
ComboItem.create!(combo: com1, item: it4, combo_price: 298)
com2 = Combo.create!(name: "Pepsi + Burger")
ComboItem.create!(combo: com2, item: it10, combo_price: 180)
ComboItem.create!(combo: com2, item: it4, combo_price: 298)
com3 = Combo.create!(name: "Coffee + Sandwich + Pepsi")
ComboItem.create!(combo: com3, item: it9, combo_price: 180)
ComboItem.create!(combo: com3, item: it11, combo_price: 340)
ComboItem.create!(combo: com3, item: it10, combo_price: 170)

p "Finally, create some existing Orders for the sample Customers consisting of the sample Items."

c1 = Customer.find_by(email: "mark.brooks@example.com")

order = Order.create!(customer: c1, submit: true, ready: true, complete: false)
order.item << it1
order.item << it4
order.item << it5

order = Order.create!(customer: c1, submit:true, ready: true, complete: true)
order.item << it3
order.item << it6

# Coffee + Burger combo
order = Order.create!(customer: c1, submit:true, ready: true, complete: true)
order.combo << com1
order.item << it4

c2 = Customer.find_by(email: "mbrando@xyz.abc")

order = Order.create!(customer: c2, submit: true, ready: true, complete: false)
order.item << it2
order.item << it5
order.item << it7

order = Order.create!(customer: c2, submit: true, ready: true, complete: true)
order.item << it3
order.item << it4
order.item << it5

# Pepsi + Burger combo
order = Order.create!(customer: c2, submit: true, ready: true, complete: true)
order.combo << com2

c3 = Customer.find_by(email: "abcefg@lmnop.qrs")

order = Order.create!(customer: c3, submit: true, ready: true, complete: false)
order.item << it1
order.item << it4
order.item << it5

# Coffee + sandwich + Pepsi combo 
order = Order.create!(customer: c3, submit: true, ready: true, complete: false)
order.combo << com3
order.item << it5

c4 = Customer.find_by(email: "dancing@hampsters.com")

order = Order.create(customer: c4, submit: true, ready: false, complete: false)
order.item << it8

# Coffee + sandwich + Pepsi combo + non-combo item French Fries
order = Order.create(customer: c4, submit: true, ready: true, complete: false)
order.combo << com3
order.item  << it5

c5 = Customer.find_by(email: "us_president@whitehouse.com")

order = Order.create(customer: c5, submit: true, ready: false, complete: false)
order.item << it1

# 1 Coffee + Burger combo, 2 Pepsi + Burger combos, + 1 rat on a stick non-combo item
order = Order.create(customer: c5, submit: true, ready: false, complete: false)
order.combo << com1
order.combo << com2
order.combo << com2
order.item  << it7

p "And we are done seeding."
