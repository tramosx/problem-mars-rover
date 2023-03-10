class MarsGrid
  attr_reader :top_right_x, :top_right_y

  def initialize(top_right_x = 0, top_right_y = 0)
    @top_right_x = top_right_x
    @top_right_y = top_right_y
  end

  def valid?(rover_x, rover_y, rover_face)
    if rover_x.between?(0, @top_right_x) &&
       rover_y.between?(0, @top_right_y) &&
       %w(N S E W).include?(rover_face)
      return true
    else
      false
    end
  end
end
