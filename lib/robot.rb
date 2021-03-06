require_relative 'navigation'

# Robot has an x, y position and a direction f
class Robot
  attr_accessor :x, :y, :f

  def initialize(x_coord = nil, y_coord = nil, facing = nil)
    @x = x_coord
    @y = y_coord
    @f = Navigation::Facing.new(facing) unless facing.nil?
  end
end
