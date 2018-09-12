require './lib/commands'
require 'test/unit'

class CommandTests < Test::Unit::TestCase
  def setup
    @command_runner = CommandRunner.new
  end

  def test_read_input_place_move_report
    @command_runner.read_input 'PLACE 0,0,NORTH'
    @command_runner.read_input 'MOVE'
    result = @command_runner.read_input 'REPORT'
    assert_equal [0, 1, 'NORTH'], result
  end

  def test_read_input_place_left_report
    @command_runner.read_input 'PLACE 0,0,NORTH'
    @command_runner.read_input 'LEFT'
    result = @command_runner.read_input 'REPORT'
    assert_equal [0, 0, 'WEST'], result
  end

  def test_read_input_mutiple_commands
    @command_runner.read_input 'PLACE 1,2,EAST'
    @command_runner.read_input 'MOVE'
    @command_runner.read_input 'MOVE'
    @command_runner.read_input 'LEFT'
    @command_runner.read_input 'MOVE'
    result = @command_runner.read_input 'REPORT'
    assert_equal [3, 3, 'NORTH'], result
  end
end
