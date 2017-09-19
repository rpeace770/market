class Checkout

	def initialize
		@basket = []
	end

	def scan(item)
		@basket << item
	end

	def total
		total = @basket.reduce(0) { |total, item| total += item.price }
		total -= coffee_coupon
		total -= chai_milk_coupon
		total -= apples_coupon
	end

	def coffee_coupon
		count = 0
		discount_amount = 0
		@basket.each do |item|
			if item.code == "CF1"
				count += 1
			end
		end

		if count >= 2
			discount_count = count / 2
			discount_amount = discount_count * 11.23
		end
		discount_amount
	end

	def chai_milk_coupon
		chai_array = []	
		milk_array = []
		discount_amount = 0

		@basket.each do |item|
			if item.code == "CH1"
				chai_array << item
			elsif item.code == "MK1"
				milk_array << item
			end
		end

		while chai_array.length > 0 && milk_array.length > 0
			chai_array.pop
			milk_array.pop
			discount_amount += 4.75
		end
		discount_amount
	end

	def apples_coupon
		discount_amount = 0
		apples_count = @basket.count { |item| item.code == "AP1" }
		if apples_count >= 3
			discount_count = apples_count / 3
			discount_amount = discount_count * 4.50
		end
		discount_amount
	end

end









