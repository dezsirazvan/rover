# frozen_string_literal: true

require './rover'

# Read input from a file specified as the first command line argument
input_file = ARGV[0]
lines = File.readlines(input_file).map(&:chomp)

# Parse the input into the plateau size, rover positions, and rover commands
plateau = lines[0].split(' ').map(&:to_i)
rover_positions = lines[1..].select.with_index { |_, i| i.even? }
rover_commands = lines[1..].select.with_index { |_, i| i.odd? }

# Explore the plateau with the given rover positions and commands
rovers = []
rover_positions.each_with_index do |position, i|
  x, y, orientation = position.split(' ')
  rovers << Rover.new(x.to_i, y.to_i, orientation, plateau)
  rover_commands[i].chars.each { |command| rovers.last.execute(command) }
end

# Print the final positions and orientations of the rovers to the terminal
rovers.each { |rover| puts rover }
