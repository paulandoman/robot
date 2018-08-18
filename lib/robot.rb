class Robot
	attr_reader :x, :y, :f

	def initialize(x_position, y_position, facing)
		@x = x_position
		@y = y_position
		@f = facing
	end
end
