require_relative 'movement'
require_relative 'placement'
require_relative 'report'
require_relative 'rotation'

# Run commands to control robot
class CommandRunner
  def read_input(input_command)
    command, args = parse(input_command)
    *args = process_args(args) unless args.nil?

    begin
      process_commands(command, args)
    rescue NoMethodError
      puts 'Enter valid command PLACE, MOVE, LEFT, RIGHT, REPORT or exit'
    rescue ArgumentError
      puts 'PLACE command has the following format PLACE [x],[y],[facing]'
    end
  end

  private

  def process_commands(command, args = [])
    case command
    when 'place' then Placement.new.place(@table, @robot, *args)
    when 'move' then Movement.new.move(@table, @robot)
    when 'left', 'right' then Rotation.new.rotate(@robot, command.to_sym)
    when 'report' then Reporting.new.report(@robot)
    when 'exit' then exit(0)
    else raise "Unknown command #{command.inspect}}"
    end
  end

  def process_args(args)
    args.split(',')
  end

  def parse(line)
    line.to_s.strip.downcase.split(' ')
  end
end
