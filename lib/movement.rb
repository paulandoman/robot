require_relative 'placed.rb'
require_relative 'valid.rb'

# Moves a robot
class Movement
  # update coordinates unless new location is outside boundary
  def move(robot)
    extend Placed, Valid

    return robot unless placed? robot
    facing = robot.f.coordinates
    new_location = [robot.x, robot.y].zip(facing).map { |a, b| a + b }
    robot.x, robot.y = new_location if valid?(new_location)
    robot
  end
end
