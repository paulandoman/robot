require './lib/robot.rb'
require 'test/unit'

class TurningTests < Test::Unit::TestCase
  def test_report_values_are_nil_when_trying_to_turn_left_unplaced_robot
    robot = Robot.new
    robot.left
    x, y, f = robot.report
    assert_nil x
    assert_nil y
    assert_nil f
  end

  def test_place_turn_left
    robot = Robot.new
    robot.place(0, 0, 'NORTH')
    robot.left
    x, y, f = robot.report
    assert_equal x, 0
    assert_equal y, 0
    assert_equal f, 'WEST'
  end

  def test_face_west_turn_right
    robot = Robot.new
    robot.place(2, 4, 'WEST')
    robot.right
    x, y, f = robot.report
    assert_equal x, 2
    assert_equal y, 4
    assert_equal f, 'NORTH'
  end

  def test_move_twice_turn_left_move_again
    robot = Robot.new
    robot.place(1, 2, 'EAST')
    robot.move
    robot.move
    robot.left
    robot.move
    x, y, f = robot.report
    assert_equal x, 3
    assert_equal y, 3
    assert_equal f, 'NORTH'
  end

  def test_report_values_are_nil_when_trying_to_turn_right_unplaced_robot
    robot = Robot.new
    robot.right
    x, y, f = robot.report
    assert_nil x
    assert_nil y
    assert_nil f
  end

  def test_place_turn_right
    robot = Robot.new
    robot.place(0, 0, 'NORTH')
    robot.right
    x, y, f = robot.report
    assert_equal x, 0
    assert_equal y, 0
    assert_equal f, 'EAST'
  end

  def test_move_twice_turn_right_move_again
    robot = Robot.new
    robot.place(1, 2, 'EAST')
    robot.move
    robot.move
    robot.right
    robot.move
    x, y, f = robot.report
    assert_equal x, 3
    assert_equal y, 1
    assert_equal f, 'SOUTH'
  end

  def test_turn_left_turn_right
    robot = Robot.new
    robot.place(4, 4, 'SOUTH')
    robot.left
    robot.right
    x, y, f = robot.report
    assert_equal x, 4
    assert_equal y, 4
    assert_equal f, 'SOUTH'
  end
end
