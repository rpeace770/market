class Item

	attr_reader :code, :name, :price

	def initialize(args)
		@code = args.fetch(:code)
		@name = args.fetch(:name)
		@price = args.fetch(:price)
	end

end