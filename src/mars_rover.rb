require_relative 'direction'

class MarsRover
  attr_accessor :id, :dir

  def initialize(index, x, y, face)
    @id = index
    @dir = Direction.new(x, y, face)
  end

  def print_current_location
    puts [@dir.x_value, @dir.y_value, @dir.face].join(' ')
  end

  def move
    @dir.move_forward
  end

  def rotate_right
    @dir.turn_right
  end

  def rotate_left
    @dir.turn_left
  end
end
