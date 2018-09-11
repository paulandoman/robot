#!/usr/bin/env ruby

require_relative 'movement.rb'
require_relative 'placement.rb'
require_relative 'report.rb'
require_relative 'rotation.rb'
require_relative 'robot.rb'

# Control the robot via the command line
class CommandRunner
  attr_reader :robot

  def run
    puts 'Hi I am Riri the REA Robot! 🤖'
    puts 'Please enter PLACE, MOVE, LEFT, RIGHT, REPORT or exit (to quit)'

    @robot = Robot.new

    loop do
      command, args = parse(gets.chomp)
      *args = process_args(args) unless args.nil?

      process_commands(command, args)
    end
  end

  private

  def process_commands(command, args)
    case command
    when 'place' then @robot = Placement.new.place(@robot, *args)
    when 'move' then @robot = Movement.new.move(@robot)
    when 'left' then @robot = Rotation.new.rotate(@robot, :left)
    when 'right' then @robot = Rotation.new.rotate(@robot, :right)
    when 'report' then Reporting.new.report(@robot)
    when 'exit' then exit(0)
    else raise "Unknown command #{command.inspect}}"
    end
  end

  def process_args(args)
    args.split(',')
  end

  def parse(line)
    line.to_s.strip.downcase.split(' ')
  end
end
