require './lib/movement'
require './lib/robot'
require './lib/rotation'
require './lib/report'
require 'test/unit'

class ReportTests < Test::Unit::TestCase
  def setup
    @rotation = Rotation.new
    @reporting = Reporting.new
  end

  def test_report_values_are_nil_when_trying_to_turn_right_unplaced_robot
    robot = Robot.new
    @rotation.rotate(robot, :right)
    x, y, f = @reporting.report(robot)
    assert_nil x
    assert_nil y
    assert_nil f
  end

  def test_report_after_placing_and_rotate
    robot = Robot.new(0, 0, Navigation::Facing.new('south', [0, -1]))
    @rotation.rotate(robot, :right)
    x, y, f = @reporting.report(robot)
    assert_equal 0, x
    assert_equal 0, y
    assert_equal 'WEST', f
  end
end
