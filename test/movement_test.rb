require './lib/robot'
require './lib/movement'
require './lib/navigation'
require 'test/unit'

class MovementTests < Test::Unit::TestCase
  def setup
    @table = Table.new
    @movement = Movement.new
  end

  def test_move_unplaced_robot_fields_are_nil
    robot = Robot.new
    @movement.move(@table, robot)
    assert_nil robot.x
    assert_nil robot.y
    assert_nil robot.f
  end

  def test_move_one_spot_north
    robot = Robot.new(0, 0, 'north')
    @movement.move(@table, robot)
    assert_equal 0, robot.x
    assert_equal 1, robot.y
    assert_equal 'north', robot.f.to_s
  end

  def test_move_one_spot_south
    robot = Robot.new(1, 3, 'south')
    @movement.move(@table, robot)
    assert_equal 1, robot.x
    assert_equal 2, robot.y
    assert_equal 'south', robot.f.to_s
  end

  def test_move_one_spot_west
    robot = Robot.new(1, 0, 'west')
    @movement.move(@table, robot)
    assert_equal 0, robot.x
    assert_equal 0, robot.y
    assert_equal 'west', robot.f.to_s
  end

  def test_move_one_spot_east
    robot = Robot.new(3, 0, 'east')
    @movement.move(@table, robot)
    assert_equal 4, robot.x
    assert_equal 0, robot.y
    assert_equal 'east', robot.f.to_s
  end

  def test_move_two_spots_north
    robot = Robot.new(0, 0, 'north')
    @movement.move(@table, robot)
    @movement.move(@table, robot)
    assert_equal 0, robot.x
    assert_equal 2, robot.y
    assert_equal 'north', robot.f.to_s
  end

  def test_move_ignore_if_trying_to_move_off_board_north
    robot = Robot.new(2, 4, 'north')
    @movement.move(@table, robot)
    assert_equal 2, robot.x
    assert_equal 4, robot.y
    assert_equal 'north', robot.f.to_s
  end

  def test_move_ignore_if_trying_to_move_off_board_west
    robot = Robot.new(1, 3, 'west')
    @movement.move(@table, robot)
    @movement.move(@table, robot)
    assert_equal 0, robot.x
    assert_equal 3, robot.y
    assert_equal 'west', robot.f.to_s
  end
end
