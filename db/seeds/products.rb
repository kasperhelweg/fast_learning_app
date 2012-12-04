product_01 = Product.new()
product_02 = Product.new()
lp = LearningPlan.find(1)

product_01.buyable = lp
product_01.price = 6000
product_01.name = "Pakke 1"


product_02.buyable = lp
product_02.price = 6000
product_02.name = "Pakke 2"


product_01.save
product_02.save

