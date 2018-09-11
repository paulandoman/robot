require './lib/robot.rb'
require './lib/placement.rb'
require 'test/unit'

class PlacementTests < Test::Unit::TestCase
  def test_place
    robot = Placement.new.place(Robot.new, 1, 2, 'SOUTH')
    assert_equal 1, robot.x
    assert_equal 2, robot.y
    assert_equal 'south', robot.f.to_s
  end

  def test_place_invalid_location_doesnt_place_robot
    robot = Placement.new.place(Robot.new, -1, 2, 'SOUTH')
    assert_nil robot.x
    assert_nil robot.y
    assert_nil robot.f
  end

  def test_place_invalid_direction_doesnt_place_robot
    robot = Placement.new.place(Robot.new, 1, 2, 'DOWN')
    assert_nil robot.x
    assert_nil robot.y
    assert_nil robot.f
  end
end
