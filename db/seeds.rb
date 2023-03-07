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
  { name: "Small soda", price: 100, discount: 0, tax_rate: 6 },
  { name: "Medium soda", price: 200, discount: 50, tax_rate: 6 },
  { name: "Large soda", price: 300, discount: 100, tax_rate: 6 },
  { name: "Hamburger", price: 350, discount: 50, tax_rate: 6 },
  { name: "French fries", price: 100, discount: 0, tax_rate: 6 },
  { name: "Braised snails", price: 1000, discount: 0, tax_rate: 10 },
  { name: "Rat on a stick", price: 500, discount: 100, tax_rate: 6 },
  { name: "Magic beans", price: 200, discount: 0, tax_rate: 20 }
])

it1 = Item.find_by(name: "Small soda")
it2 = Item.find_by(name: "Medium soda")
it3 = Item.find_by(name: "Large soda")
it4 = Item.find_by(name: "Hamburger")
it5 = Item.find_by(name: "French fries")
it6 = Item.find_by(name: "Braised snails")
it7 = Item.find_by(name: "Rat on a stick")
it8 = Item.find_by(name: "Magic beans")

p "Finally, create some existing Orders for the sample Customers consisting of the sample Items."

c1 = Customer.find_by(email: "mark.brooks@example.com")

order = Order.new(submit: true, ready: true, complete: false)
order.item << it1
order.item << it4
order.item << it5
c1.order << order

order = Order.new(submit:true, ready: true, complete: true)
order.item << it3
order.item << it6
c1.order << order

c2 = Customer.find_by(email: "mbrando@xyz.abc")

order = Order.new(submit: true, ready: true, complete: false)
order.item << it2
order.item << it5
order.item << it7
c2.order << order

order = Order.new(submit: true, ready: true, complete: true)
order.item << it3
order.item << it4
order.item << it5
c2.order << order

c3 = Customer.find_by(email: "abcefg@lmnop.qrs")

order = Order.new(submit: true, ready: true, complete: false)
order.item << it1
order.item << it4
order.item << it5
c3.order << order

c4 = Customer.find_by(email: "dancing@hampsters.com")

order = Order.new(submit: true, ready: false, complete: false)
order.item << it8
c4.order << order

c5 = Customer.find_by(email: "us_president@whitehouse.com")

order = Order.new(submit: true, ready: false, complete: false)
order.item << it1
c5.order << order

p "And we are done seeding."
