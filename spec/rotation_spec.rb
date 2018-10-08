require './lib/robot'
require './lib/rotation'

RSpec.describe Rotation, '#rotate' do
  before do
    @rotation = Rotation.new
  end

  context 'unplaced robot' do
    it 'when rotated will return nil fields' do
      robot = Robot.new
      @rotation.rotate(robot, :left)
      expect(robot.x).to be_nil
      expect(robot.y).to be_nil
      expect(robot.f).to be_nil
    end
  end

  context 'placed robot' do
    it 'when rotated left is updated' do
      robot = Robot.new(0, 0, 'north')
      @rotation.rotate(robot, :left)
      expect(robot.x).to eq(0)
      expect(robot.y).to eq(0)
      expect(robot.f.to_s).to eq('west')
    end

    it 'when rotated right is updated' do
      robot = Robot.new(2, 4, 'west')
      @rotation.rotate(robot, :right)
      expect(robot.x).to eq(2)
      expect(robot.y).to eq(4)
      expect(robot.f.to_s).to eq('north')
    end

    it 'when twice rotated left is updated' do
      robot = Robot.new(3, 3, 'east')
      @rotation.rotate(robot, :left)
      @rotation.rotate(robot, :left)
      expect(robot.x).to eq(3)
      expect(robot.y).to eq(3)
      expect(robot.f.to_s).to eq('west')
    end
  end
end
