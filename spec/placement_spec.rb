require './lib/robot'
require './lib/placement'
require './lib/table'

def make_placement
  Placement.new
end

RSpec.describe Placement, '#place' do
  before do
    @table = Table.new
  end

  describe 'robot placed within table boundary' do
    it 'will have updated values' do
      robot = make_placement.place(@table, Robot.new, 1, 2, 'SOUTH')
      expect(robot.x).to eq(1)
      expect(robot.y).to eq(2)
      expect(robot.f.to_s).to eq('south')
    end
  end

  describe 'robot placed with x coordinate outside table boundary' do
    it 'will have nil values' do
      robot = make_placement.place(@table, Robot.new, -1, 2, 'SOUTH')
      expect(robot.x).to be_nil
      expect(robot.y).to be_nil
      expect(robot.f).to be_nil
    end
  end

  describe 'robot placed with y coordinate outside table boundary' do
    it 'will have nil values' do
      robot = make_placement.place(@table, Robot.new, 1, 2, 'DOWN')
      expect(robot.x).to be_nil
      expect(robot.y).to be_nil
      expect(robot.f).to be_nil
    end
  end
end
