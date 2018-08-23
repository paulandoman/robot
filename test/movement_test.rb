require './lib/robot.rb'
require './lib/navigation.rb'
require 'test/unit'

class MovementTests < Test::Unit::TestCase
  def test_report_values_are_nil_when_trying_to_move_unplaced_robot
    robot = Robot.new
    robot.move
    x, y, f = robot.report
    assert_nil x
    assert_nil y
    assert_nil f
  end

  def test_place_robot_move_one_spot_north
    robot = Robot.new
    robot.place(0, 0, 'NORTH')
    robot.move
    x, y, f = robot.report
    assert_equal x, 0
    assert_equal y, 1
    assert_equal f, 'NORTH'
  end

  def test_place_robot_move_one_spot_south
    robot = Robot.new
    robot.place(1, 3, 'SOUTH')
    robot.move
    x, y, f = robot.report
    assert_equal x, 1
    assert_equal y, 2
    assert_equal f, 'SOUTH'
  end

  def test_place_robot_move_one_spot_west
    robot = Robot.new
    robot.place(1, 0, 'WEST')
    robot.move
    x, y, f = robot.report
    assert_equal x, 0
    assert_equal y, 0
    assert_equal f, 'WEST'
  end

  def test_place_robot_move_one_spot_east
    robot = Robot.new
    robot.place(3, 0, 'EAST')
    robot.move
    x, y, f = robot.report
    assert_equal x, 4
    assert_equal y, 0
    assert_equal f, 'EAST'
  end

  def test_place_robot_move_two_spots_north
    robot = Robot.new
    robot.place(0, 0, 'NORTH')
    robot.move
    robot.move
    x, y, f = robot.report
    assert_equal x, 0
    assert_equal y, 2
    assert_equal f, 'NORTH'
  end

  def test_place_robot_ignore_if_trying_to_move_off_board_north
    robot = Robot.new
    robot.place(2, 4, 'NORTH')
    robot.move
    x, y, f = robot.report
    assert_equal x, 2
    assert_equal y, 4
    assert_equal f, 'NORTH'
  end

  def test_place_robot_ignore_if_trying_to_move_off_board_west
    robot = Robot.new
    robot.place(1, 3, 'WEST')
    robot.move
    robot.move
    x, y, f = robot.report
    assert_equal x, 0
    assert_equal y, 3
    assert_equal f, 'WEST'
  end
end
