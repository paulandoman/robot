#!/usr/bin/env ruby

require './lib/border.rb'

# Robot has an x, y position and a direction f
class Robot
  attr_reader :x, :y, :f

  def initialize
    @x = nil
    @y = nil
    @f = nil
  end

  # place robot if coordinates are within boundary
  def place(x_coord, y_coord, facing)
    return if invalid?([x_coord, y_coord])
    @x = x_coord
    @y = y_coord
    @f = facing
  end

  # update coordinates unless new location is outside boundary
  def move
    new_location = [@x, @y].zip(@f).map { |a, b| a + b }
    @x, @y = new_location unless invalid?(new_location)
  end

  # return the coordinates of the robot
  def report
    [@x, @y, @f]
  end

  private

  # return true if new location is outside boundary
  def invalid?(location)
    x = location.first
    y = location.last

    x < Border::WEST || x > Border::EAST || \
      y > Border::NORTH || y < Border::SOUTH
  end
end