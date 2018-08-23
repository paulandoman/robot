#!/usr/bin/env ruby

require './lib/robot.rb'

# Control the robot via the command line
class CommandRunner
  attr_reader :robot

  def run
    puts 'Hi I am Riri the REA Robot! 🤖'
    puts 'Please enter PLACE, MOVE, LEFT, RIGHT, REPORT or exit (to quit)'

    @robot = Robot.new

    loop do
      command, args = parse(gets.chomp)
      send_command(command, args)
    end
  end

  private

  def send_command(command, *args)
    if args.nil? || args.first.nil?
      @robot.send(command)
    else
      *arguments = args.first.split(',')
      @robot.send(command, *arguments)
    end
  rescue NoMethodError
    puts 'Enter valid command PLACE, MOVE, LEFT, RIGHT, REPORT or exit'
  rescue ArgumentError
    puts 'PLACE command has the following format PLACE [x] [y] [facing]'
  end

  def parse(line)
    line.to_s.strip.downcase.split(' ')
  end
end
