# Customer.all.destroy
# Inventory.all.destroy
# Item.all.destroy
# Purchase.all.destroy
# Store.all.destroy

alex = Customer.create(name: "Alex", current_location: "1440 G St. NW, Washington DC 20001")
truce = Customer.create(name: "Truce", current_location: "60008 Franklin square, Washington D.C. 20015")
bode = Customer.create(name: "Bode", current_location: "5959 Dublin street, Washington D.C. 20033")

shoppers = Store.create(name: "Shoppers World", address: "1259 Washington Boulevard, Washington, D.C. 20002")
bargain = Store.create(name: "Bargain Shopper", address: "625 Bargain St, Washington, D.C. 20002")
wallys = Store.create(name: "Wally's", address: "131 Alamo St, Washington, D.C. 20002")
costco = Store.create(name: "Costco", address: "5 Oily way, Washington, D.C. 20012")
boscos = Store.create(name: "Bosco's", address: "12 Union Blvd, Washington, D.C. 20012")
kroger = Store.create(name: "Kroger", address: "4000 Washington Boulevard, Washington, D.C. 20012")
heb = Store.create(name: "H-E-B", address: "525 Williams Way, Washington, D.C. 20012")
walmart = Store.create(name: "Walmart", address: "5288 Mushin Street, Washington, D.C. 20019")


bread = Item.create(name:'Bread', qty: 1)
sweetnsour = Item.create(name:'Sweet N Sour', qty: 1)
mixed_nuts = Item.create(name: "Mixed Nuts - salted", qty: 2)
milk = Item.create(name: "Milk", qty: 1)
chips = Item.create(name: "Doritos", qty: 2)
chili = Item.create(name: "Wolf Brand Chili", qty: 3)
crackers = Item.create(name: "M")
