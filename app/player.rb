class Player

	attr_reader :name, :choice

	def initialize(name = nil, choice = nil)
		@name = name
		@choice = choice
	end

end