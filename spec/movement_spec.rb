require './lib/robot'
require './lib/movement'
require './lib/navigation'

RSpec.describe Movement, '#move' do
  before do
    @table = Table.new
    @movement = Movement.new
  end

  context 'an unplaced robot' do
    it 'will return robot with all fields nil' do
      robot = Robot.new
      @movement.move(@table, robot)
      expect(robot.x).to be_nil
      expect(robot.y).to be_nil
      expect(robot.f).to be_nil
    end
  end

  context 'when north facing robot moves forward' do
    it 'location is updated' do
      robot = Robot.new(0, 0, 'north')
      @movement.move(@table, robot)
      expect(robot.x).to eq 0
      expect(robot.y).to eq 1
      expect(robot.f.to_s).to eq 'north'
    end
  end

  context 'when south facing robot moves forward' do
    it 'location is updated' do
      robot = Robot.new(1, 3, 'south')
      @movement.move(@table, robot)
      expect(robot.x).to eq 1
      expect(robot.y).to eq 2
      expect(robot.f.to_s).to eq 'south'
    end
  end

  context 'when west facing robot moves forward' do
    it 'location is updated' do
      robot = Robot.new(1, 0, 'west')
      @movement.move(@table, robot)
      expect(robot.x).to eq 0
      expect(robot.y).to eq 0
      expect(robot.f.to_s).to eq 'west'
    end
  end

  context 'when east facing robot moves forward' do
    it 'location is updated' do
      robot = Robot.new(3, 0, 'east')
      @movement.move(@table, robot)
      expect(robot.x).to eq 4
      expect(robot.y).to eq 0
      expect(robot.f.to_s).to eq 'east'
    end
  end

  context 'when north facing robot moves forward twice' do
    it 'location is updated' do
      robot = Robot.new(0, 0, 'north')
      @movement.move(@table, robot)
      @movement.move(@table, robot)
      expect(robot.x).to eq 0
      expect(robot.y).to eq 2
      expect(robot.f.to_s).to eq 'north'
    end
  end

  context 'when north facing robot on edge of table tries to move forward' do
    it 'location is not updated' do
      robot = Robot.new(2, 4, 'north')
      @movement.move(@table, robot)
      expect(robot.x).to eq 2
      expect(robot.y).to eq 4
      expect(robot.f.to_s).to eq 'north'
    end
  end

  context 'when west facing robot placed one from edge of table tries to move 2 forward' do
    it 'location is updated to the edge of the table' do
      robot = Robot.new(1, 3, 'west')
      @movement.move(@table, robot)
      @movement.move(@table, robot)
      expect(robot.x).to eq 0
      expect(robot.y).to eq 3
      expect(robot.f.to_s).to eq 'west'
    end
  end
end
