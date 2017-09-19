require_relative 'checkout'
require_relative 'item'

# ITEMS

# +--------------|--------------|---------+
# | Product Code |     Name     |  Price  |
# +--------------|--------------|---------+
# |     CH1      |   Chai       |  $3.11  |
# |     AP1      |   Apples     |  $6.00  |
# |     CF1      |   Coffee     | $11.23  |
# |     MK1      |   Milk       |  $4.75  |
# +--------------|--------------|---------+

# COUPONS

# BOGO -- Buy-One-Get-One-Free Special on Coffee. (Unlimited)
# APPL -- If you buy 3 or more bags of Apples, the price drops to $4.50.
# CHMK -- Purchase a box of Chai and get milk free. (Limit 1)

# TEST DATA

# Basket: CH1, AP1, CF1, MK1
# Total price expected: $20.34
# Basket: MK1, AP1
# Total price expected: $10.75
# Basket: CF1, CF1
# Total price expected: $11.23
# Basket: AP1, AP1, CH1, AP1
# Total price expected: $16.61



chai = Item.new({code: "CH1", name: "Chai", price: 3.11})
apples = Item.new({code: "AP1", name: "Apples", price: 6.00})
coffee = Item.new({code: "CF1", name: "Coffee", price: 11.23})
milk = Item.new({code: "MK1", name: "Milk", price: 4.75})

co = Checkout.new
co.scan(apples)
co.scan(apples)
co.scan(chai)
co.scan(apples)
co.total












