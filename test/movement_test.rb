require './lib/robot.rb'
require './lib/movement.rb'
require './lib/navigation.rb'
require 'test/unit'

class MovementTests < Test::Unit::TestCase
  def test_move_unplaced_robot_fields_are_nil
    robot = Movement.new.move(Robot.new)
    assert_nil robot.x
    assert_nil robot.y
    assert_nil robot.f
  end

  def test_move_one_spot_north
    robot = Robot.new(0, 0, Navigation::Facing.new('north', [0, 1]))
    moved_robot = Movement.new.move(robot)
    assert_equal 0, moved_robot.x
    assert_equal 1, moved_robot.y
    assert_equal 'north', moved_robot.f.to_s
  end

  def test_move_one_spot_south
    robot = Robot.new(1, 3, Navigation::Facing.new('south', [0, -1]))
    moved_robot = Movement.new.move(robot)
    assert_equal 1, moved_robot.x
    assert_equal 2, moved_robot.y
    assert_equal 'south', moved_robot.f.to_s
  end

  def test_move_one_spot_west
    robot = Robot.new(1, 0, Navigation::Facing.new('west', [-1, 0]))
    moved_robot = Movement.new.move(robot)
    assert_equal 0, moved_robot.x
    assert_equal 0, moved_robot.y
    assert_equal 'west', moved_robot.f.to_s
  end

  def test_move_one_spot_east
    robot = Robot.new(3, 0, Navigation::Facing.new('east', [1, 0]))
    moved_robot = Movement.new.move(robot)
    assert_equal 4, moved_robot.x
    assert_equal 0, moved_robot.y
    assert_equal 'east', moved_robot.f.to_s
  end

  def test_move_two_spots_north
    robot = Robot.new(0, 0, Navigation::Facing.new('north', [0, 1]))
    movement = Movement.new
    moved_robot = movement.move movement.move robot
    assert_equal 0, moved_robot.x
    assert_equal 2, moved_robot.y
    assert_equal 'north', moved_robot.f.to_s
  end

  def test_move_ignore_if_trying_to_move_off_board_north
    robot = Robot.new(2, 4, Navigation::Facing.new('north', [0, 1]))
    moved_robot = Movement.new.move(robot)
    assert_equal 2, moved_robot.x
    assert_equal 4, moved_robot.y
    assert_equal 'north', moved_robot.f.to_s
  end

  def test_move_ignore_if_trying_to_move_off_board_west
    robot = Robot.new(1, 3, Navigation::Facing.new('west', [-1, 0]))
    movement = Movement.new
    moved_robot = movement.move movement.move robot
    assert_equal 0, moved_robot.x
    assert_equal 3, moved_robot.y
    assert_equal 'west', moved_robot.f.to_s
  end
end
