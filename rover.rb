# frozen_string_literal: true

class Rover
  # The four cardinal compass directions in clockwise order
  DIRECTIONS = %w[N E S W].freeze

  # Initialize the rover with an initial position and orientation on the given plateau
  def initialize(x, y, orientation, plateau)
    @x = x
    @y = y
    @orientation = orientation
    @plateau = plateau
  end

  # Execute a single command by either turning left, turning right, or moving forward
  def execute(command)
    case command
    when 'L' then turn_left
    when 'R' then turn_right
    when 'M' then move
    end
  end

  # Return a string representation of the final position and orientation of the rover
  def to_s
    "#{@x} #{@y} #{@orientation}"
  end

  private

  # Turn the rover 90 degrees counterclockwise
  def turn_left
    @orientation = DIRECTIONS[(DIRECTIONS.index(@orientation) - 1) % 4]
  end

  # Turn the rover 90 degrees clockwise
  def turn_right
    @orientation = DIRECTIONS[(DIRECTIONS.index(@orientation) + 1) % 4]
  end

  # Move the rover one unit forward in its current orientation, but only within the bounds of the plateau
  def move
    case @orientation
    when 'N' then @y += 1
    when 'E' then @x += 1
    when 'S' then @y -= 1
    when 'W' then @x -= 1
    end
    @x = [@x, 0].max
    @y = [@y, 0].max
    @x = [@x, @plateau[0]].min
    @y = [@y, @plateau[1]].min
  end
end
