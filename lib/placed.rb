# Checks if the robot has been placed
module Placed
  # return true if robot not yet placed within border
  def placed?(robot)
    !(robot.x.nil? || robot.y.nil? || robot.f.nil?)
  end
end
