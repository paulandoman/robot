require './lib/robot'
require 'test/unit'

class RobotTests < Test::Unit::TestCase
  def test_robot_initialized_with_nil_fields
    robot = Robot.new
    assert_nil robot.x
    assert_nil robot.y
    assert_nil robot.f
  end

  def test_robot_initialized_with_fields
    robot = Robot.new(3, 4, 'south')
    assert_equal 3, robot.x
    assert_equal 4, robot.y
    assert_equal 'south', robot.f.to_s
  end
end
