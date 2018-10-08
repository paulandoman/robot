require './lib/robot'
require './lib/report'

RSpec.describe Reporting, '#report' do
  def make_reporting
    Reporting.new
  end

  context 'an unplaced robot' do
    it 'will report values are nil' do
      robot = Robot.new
      x, y, f = make_reporting.report(robot)
      expect(x).to be_nil
      expect(y).to be_nil
      expect(f).to be_nil
    end
  end

  context 'a placed robot' do
    it 'will report values' do
      robot = Robot.new(0, 0, 'south')
      x, y, f = make_reporting.report(robot)
      expect(x).to eq(0)
      expect(y).to eq(0)
      expect(f).to eq('SOUTH')
    end
  end
end
