require './lib/robot.rb'
require './lib/navigation.rb'
require 'test/unit'

class PlacementTests < Test::Unit::TestCase
	def test_initialize_robot
		robot = Robot.new(0, 0, Navigation::NORTH)
		assert_equal robot.x, 0
		assert_equal robot.y, 0
		assert_equal robot.f, Navigation::NORTH
	end
end

