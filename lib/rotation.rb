require_relative 'placed.rb'
require_relative 'navigation.rb'

# Rotates a robot
class Rotation
  # turn robot 90 degrees
  def rotate(robot, direction)
    if direction == :left
      left robot
    else
      right robot
    end
  end

  private

  # turn robot 90 degrees to the left
  def left(robot)
    extend Placed

    return robot unless placed? robot
    robot.f = Navigation::ALL[
      Navigation::ALL.index(robot.f) - 1
    ]
    robot
  end

  # turn robot 90 degrees to the right
  def right(robot)
    extend Placed

    return robot unless placed? robot
    robot.f = Navigation::ALL[
      (Navigation::ALL.index(robot.f) + 1) % Navigation::ALL.size
    ]
    robot
  end
end
