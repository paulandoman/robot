require_relative 'placed'
require_relative 'valid'

# Moves a robot
class Movement
  # update coordinates unless new location is outside boundary
  def move(table, robot)
    extend Placed, Valid

    return robot unless placed? robot

    new_location = one_space_forward robot

    robot.x, robot.y = new_location if valid?(table, new_location)
    robot
  end

  private

  # return coordinates of the next space forward of the robot
  def one_space_forward(robot)
    facing = robot.f.coordinates
    [robot.x, robot.y].zip(facing).map { |a, b| a + b }
  end
end
