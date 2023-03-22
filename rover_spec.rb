# frozen_string_literal: true

require './rover'

RSpec.describe Rover do
  let(:plateau) { [5, 5] }

  describe '#execute' do
    context 'when the command is "L"' do
      it 'turns the rover left' do
        rover = Rover.new(3, 3, 'N', plateau)
        rover.execute('L')
        expect(rover.instance_variable_get(:@orientation)).to eq('W')
      end
    end

    context 'when the command is "R"' do
      it 'turns the rover right' do
        rover = Rover.new(3, 3, 'N', plateau)
        rover.execute('R')
        expect(rover.instance_variable_get(:@orientation)).to eq('E')
      end
    end

    context 'when the command is "L"' do
      it 'turns the rover left' do
        rover = Rover.new(3, 3, 'N', plateau)
        rover.execute('L')
        expect(rover.to_s).to eq('3 3 W')
      end
    end

    context 'when the command is "R"' do
      it 'turns the rover right' do
        rover = Rover.new(3, 3, 'N', plateau)
        rover.execute('R')
        expect(rover.to_s).to eq('3 3 E')
      end
    end

    context 'and the rover is at the edge of the plateau' do
      it 'does not move the rover' do
        rover = Rover.new(5, 5, 'N', plateau)
        rover.execute('M')
        expect(rover.to_s).to eq('5 5 N')
      end
    end

    context 'when the command is "M"' do
      it 'moves the rover forward' do
        rover = Rover.new(3, 3, 'N', plateau)
        rover.execute('M')
        expect(rover.to_s).to eq('3 4 N')
      end
    end
  end

  describe '#to_s' do
    it 'returns the position and orientation of the rover as a string' do
      rover = Rover.new(3, 3, 'N', plateau)
      expect(rover.to_s).to eq('3 3 N')
    end
  end
end
