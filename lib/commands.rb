#!/usr/bin/env ruby

require_relative 'commandrunner'
require_relative 'robot'
require_relative 'table'

# Control the robot via the command line
class CommandRunner
  attr_reader :robot, :table

  def initialize
    @robot = Robot.new
    @table = Table.new
  end

  def run
    puts 'Hi I am Riri the REA Robot! 🤖'
    puts 'Please enter PLACE, MOVE, LEFT, RIGHT, REPORT or exit (to quit)'

    command = CommandRunner.new

    loop do
      command.read_input(gets.chomp)
    end
  end
end
