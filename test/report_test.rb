require './lib/movement.rb'
require './lib/robot.rb'
require './lib/rotation.rb'
require './lib/report.rb'
require 'test/unit'

class ReportTests < Test::Unit::TestCase
  def test_report_values_are_nil_when_trying_to_turn_right_unplaced_robot
    robot = Robot.new
    Rotation.new.rotate(robot, :right)
    x, y, f = Reporting.new.report(robot)
    assert_nil x
    assert_nil y
    assert_nil f
  end

  def test_report_after_placing_and_rotate
    robot = Robot.new(0, 0, Navigation::Facing.new('south', [0, -1]))
    robot_rotate = Rotation.new.rotate(robot, :right)
    x, y, f = Reporting.new.report(robot_rotate)
    assert_equal 0, x
    assert_equal 0, y
    assert_equal 'WEST', f
  end

  def test_report_move_twice_rotate_right_move_again
    robot = Robot.new(1, 2, Navigation::Facing.new('east', [1, 0]))
    movement = Movement.new
    moved_robot = movement.move movement.move robot
    final_robot = movement.move Rotation.new.rotate(moved_robot, :right)
    x, y, f = Reporting.new.report(final_robot)
    assert_equal 3, x
    assert_equal 1, y
    assert_equal 'SOUTH', f
  end

  def test_turn_left_turn_right
    robot = Robot.new(4, 4, Navigation::Facing.new('south', [0, -1]))
    robot_left = Rotating.new.rotate(robot, :left)
    robot_right = Rotating.new(robot_left, :right)
    x, y, f = Reporting.new.report(robot_right)
    assert_equal x, 4
    assert_equal y, 4
    assert_equal f, 'SOUTH'
  end
end
