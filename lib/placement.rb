require_relative 'navigation'
require_relative 'valid'

# Places a robot
class Placement
  # place robot if coordinates are within boundary
  def place(table, robot, x_coord, y_coord, facing)
    extend Valid

    return robot unless valid?(table, [x_coord, y_coord])

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
