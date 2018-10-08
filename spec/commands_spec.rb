require './lib/commands'
require './lib/commands'

RSpec.describe Commands, '#read_input' do
  describe 'after placing the robot' do
    before do
      @commands = Commands.new
    end

    it 'moves forward then reports' do
      @commands.read_input 'PLACE 0,0,NORTH'
      @commands.read_input 'MOVE'
      result = @commands.read_input 'REPORT'
      expect(result).to eq [0, 1, 'NORTH']
    end

    it 'turns left then reports' do
      @commands.read_input 'PLACE 0,0,NORTH'
      @commands.read_input 'LEFT'
      result = @commands.read_input 'REPORT'
      expect(result).to eq [0, 0, 'WEST']
    end

    it 'moves forward twice, turns left, moves forward then reports' do
      @commands.read_input 'PLACE 1,2,EAST'
      @commands.read_input 'MOVE'
      @commands.read_input 'MOVE'
      @commands.read_input 'LEFT'
      @commands.read_input 'MOVE'
      result = @commands.read_input 'REPORT'
      expect(result).to eq [3, 3, 'NORTH']
    end
  end
end
