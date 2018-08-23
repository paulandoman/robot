# Robot
REA Robot Coding Task

## Building
Run `bundle install` to install any dependencies 

## Testing
To run the unit tests run `rake`

## Usage
Start the application in the command line by running `./bin/robot`

To control the robot use the following commands

- **PLACE** will put the toy robot on the table in position X,Y and facing NORTH,
  SOUTH, EAST or WEST.
  eg. `PLACE 1,1,EAST` will place the robot at **1,1** facing **east**.
- The origin (0,0) can be considered to be the SOUTH WEST most corner.
- The first valid command to the robot is a **PLACE** command, after that, any
  sequence of commands may be issued, in any order, including another **PLACE**
  command.
- **MOVE** will move the toy robot one unit forward in the direction it is
  currently facing.
- **LEFT** and **RIGHT** will rotate the robot 90 degrees in the specified direction
  without changing the position of the robot.
- **REPORT** will announce the X,Y and F of the robot.
- **exit** will exit the application
