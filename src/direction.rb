class Direction
  attr_accessor :x_value, :y_value, :face

  north = {
    'L' => 'W',
    'R' => 'E'
  }

  south = {
    'L' => 'E',
    'R' => 'W'
  }

  east = {
    'L' => 'N',
    'R' => 'S'
  }

  west = {
    'L' => 'S',
    'R' => 'N'
  }

  @@direction_hash = {
    'N' => north,
    'S' => south,
    'E' => east,
    'W' => west
  }

  @@axis_hash = {
    'N' => 'Y',
    'S' => 'Y',
    'E' => 'X',
    'W' => 'X'
  }

  @@value_hash = {
    'N' => 1,
    'S' => -1,
    'E' => 1,
    'W' => -1
  }

  def initialize(x, y, face)
    @x_value = x
    @y_value = y
    @face = face
  end

  def turn_left
    @face = @@direction_hash[@face]['L']
  end

  def turn_right
    @face = @@direction_hash[@face]['R']
  end

  def move_forward
    if @@axis_hash[@face] == 'X'
      @x_value += @@value_hash[@face]
    elsif @@axis_hash[@face] == 'Y'
      @y_value += @@value_hash[@face]
    end
  end
end
