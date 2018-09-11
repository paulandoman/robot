require './lib/robot.rb'
require './lib/rotation.rb'
require 'test/unit'

class RotationTests < Test::Unit::TestCase
  def test_rotate_unplaced_robot_returns_nil_fields
    turned_robot = Rotation.new.rotate(Robot.new, :left)
    assert_nil turned_robot.x
    assert_nil turned_robot.y
    assert_nil turned_robot.f
  end

  def test_rotate_left
    robot = Robot.new(0, 0, Navigation::Facing.new('north', [0, 1]))
    turned_robot = Rotation.new.rotate(robot, :left)
    assert_equal 0, turned_robot.x
    assert_equal 0, turned_robot.y
    assert_equal 'west', turned_robot.f.to_s
  end

  def test_rotate_right
    robot = Robot.new(2, 4, Navigation::Facing.new('west', [-1, 0]))
    turned_robot = Rotation.new.rotate(robot, :right)
    assert_equal 2, turned_robot.x
    assert_equal 4, turned_robot.y
    assert_equal 'north', turned_robot.f.to_s
  end

  def test_rotate_twice
    robot = Robot.new(3, 3, Navigation::Facing.new('east', [1, 0]))
    rotation = Rotation.new
    robot_rotated_once = rotation.rotate(robot, :left)
    robot_rotated_twce = rotation.rotate(robot_rotated_once, :left)
    assert_equal 3, robot_rotated_twce.x
    assert_equal 3, robot_rotated_twce.y
    assert_equal 'west', robot_rotated_twce.f.to_s
  end
end
