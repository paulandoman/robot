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
    return unless valid?([x_coord, y_coord])

    @x = x_coord.to_i
    @y = y_coord.to_i

    if Navigation.has? facing then @f = Navigation.const_get facing.upcase
    else
      puts 'Invalid robot direction - please use NORTH, SOUTH, EAST or WEST'
    end
  end

  # update coordinates unless new location is outside boundary
  def move
    return unless placed?
    facing = @f.drop(1)
    new_location = [@x, @y].zip(facing).map { |a, b| a + b }
    @x, @y = new_location if valid?(new_location)
  end

  # turn robot 90 degrees to the left
  def left
    return unless placed?
    @f = Navigation::ALL[Navigation::ALL.index(@f) - 1]
  end

  # turn robot 90 degrees to the right
  def right
    return unless placed?
    @f = Navigation::ALL[(Navigation::ALL.index(@f) + 1) % Navigation::ALL.size]
  end

  # return the coordinates of the robot
  def report
    if placed?
      facing = @f.first.upcase
      puts "#{x},#{y},#{facing}"
      [@x, @y, facing]
    else
      [nil, nil, nil]
    end
  end

  private

  # return true if robot not yet placed within border
  def placed?
    !(@x.nil? || @y.nil? || @f.nil?)
  end

  # return true if new location is a valid location
  def valid?(location)
    x = location.first
    y = location.last

    if non_integer_string?(x, y)
      puts 'Please enter valid coordinates for x, y'
      return false
    end

    x = x.to_i
    y = y.to_i

    x >= 0 && x <= Border::WIDTH && y <= Border::HEIGHT && y >= 0
  end

  # return true if one or more location strings cant be converted to integers
  def non_integer_string?(x_value, y_value)
    x_value.is_a?(String) && x_value.scan(/\d/).empty? || \
      y_value.is_a?(String) && y_value.scan(/\d/).empty?
  end
end
