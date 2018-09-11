# Reports on the robot
class Reporting
  # return the coordinates of the robot
  def report(robot)
    if placed? robot
      facing = robot.f.label.upcase
      puts "#{robot.x},#{robot.y},#{facing}"
      [robot.x, robot.y, facing]
    else
      [nil, nil, nil]
    end
  end
end
