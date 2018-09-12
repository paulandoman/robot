require './lib/robot'
require './lib/rotation'
require 'test/unit'

class RotationTests < Test::Unit::TestCase
  def setup
    @rotation = Rotation.new
  end

  def test_rotate_unplaced_robot_returns_nil_fields
    robot = Robot.new
    @rotation.rotate(robot, :left)
    assert_nil robot.x
    assert_nil robot.y
    assert_nil robot.f
  end

  def test_rotate_left
    robot = Robot.new(0, 0, Navigation::Facing.new('north', [0, 1]))
    @rotation.rotate(robot, :left)
    assert_equal 0, robot.x
    assert_equal 0, robot.y
    assert_equal 'west', robot.f.to_s
  end

  def test_rotate_right
    robot = Robot.new(2, 4, Navigation::Facing.new('west', [-1, 0]))
    @rotation.rotate(robot, :right)
    assert_equal 2, robot.x
    assert_equal 4, robot.y
    assert_equal 'north', robot.f.to_s
  end

  def test_rotate_twice
    robot = Robot.new(3, 3, Navigation::Facing.new('east', [1, 0]))
    @rotation.rotate(robot, :left)
    @rotation.rotate(robot, :left)
    assert_equal 3, robot.x
    assert_equal 3, robot.y
    assert_equal 'west', robot.f.to_s
  end
end
