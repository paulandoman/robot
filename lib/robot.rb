#!/usr/bin/env ruby

# Robot has a x, y position and a direction
class Robot
  attr_reader :x, :y, :f

  def initialize
    @x = nil
    @y = nil
    @f = nil
  end

  def place(x_coord, y_coord, facing)
    return if x_coord < 0 || x_coord > 4 || y_coord < 0 || y_coord > 4
    @x = x_coord
    @y = y_coord
    @f = facing
  end

  def report
    [@x, @y, @f]
  end
end
