require './lib/robot.rb'
require './lib/navigation.rb'
require 'test/unit'

class PlacementTests < Test::Unit::TestCase
  def test_report_values_are_nil_when_robot_not_yet_placed
    robot = Robot.new
    x, y, f = robot.report
    assert_nil x
    assert_nil y
    assert_nil f
  end

  def test_place_robot_then_call_report
    robot = Robot.new
    robot.place(1, 2, 'SOUTH')
    x, y, f = robot.report
    assert_equal x, 1
    assert_equal y, 2
    assert_equal f, 'SOUTH'
  end

  def test_report_values_are_nil_when_robot_illegally_placed
    robot = Robot.new
    robot.place(-1, 6, 'EAST')
    x, y, f = robot.report
    assert_nil x
    assert_nil y
    assert_nil f
  end
end
