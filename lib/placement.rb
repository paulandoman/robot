require_relative 'navigation.rb'
require_relative 'border.rb'
require_relative 'valid.rb'

# Places a robot
class Placement
  # place robot if coordinates are within boundary
  def place(robot, x_coord, y_coord, facing)
    extend Valid

    return robot unless valid?([x_coord, y_coord])

    if Navigation.has? facing
      robot.f = Navigation.get facing
      robot.x = x_coord.to_i
      robot.y = y_coord.to_i
    else
      puts 'Invalid robot direction - please use NORTH, SOUTH, EAST or WEST'
    end

    robot
  end
end
