require './lib/robot'

RSpec.describe Robot, '#report' do
  context 'an unplaced robot' do
    it 'will contain nil fields' do
      robot = Robot.new
      expect(robot.x).to be_nil
      expect(robot.y).to be_nil
      expect(robot.f).to be_nil
    end
  end

  context 'a placed robot' do
    it 'will have correct fields' do
      robot = Robot.new(3, 4, 'south')
      expect(robot.x).to eq(3)
      expect(robot.y).to eq(4)
      expect(robot.f.to_s).to eq('south')
    end
  end
end
