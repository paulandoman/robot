#!/usr/bin/env ruby

# Robot has a x, y position and a direction
class Robot
  attr_reader :x, :y, :f

  def initialize
    @x = nil
    @y = nil
    @f = nil
  end

  def place(x_position, y_position, facing)
    @x = x_position
    @y = y_position
    @f = facing
  end

  def report
    [@x, @y, @f]
  end
end
