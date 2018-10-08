#!/usr/bin/env ruby

require_relative 'commands'
require_relative 'robot'
require_relative 'table'

# Control the robot via the command line
class CommandRunner
  def initialize(robot = Robot.new, table = Table.new)
    @robot = robot
    @table = table
  end

  def run
    puts 'Hi I am Riri the REA Robot!'
    puts 'Please enter PLACE, MOVE, LEFT, RIGHT, REPORT or exit (to quit)'

    command = Commands.new(@robot, @table)

    loop do
      command.read_input(gets.chomp)
    end
  end
end
