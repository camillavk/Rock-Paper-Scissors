class Player

	attr_accessor :name, :choice

	def initialize(name = nil, choice = nil)
		@name = name
		@choice = choice
	end

end