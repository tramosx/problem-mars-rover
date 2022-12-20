require_relative 'mars_rover'
require_relative 'mars_grid'

class Solution
  attr_accessor :grid, :rover

  def input_grid_valid?(mars_top_right_x, mars_top_right_y)
    result = Integer(mars_top_right_x) && Integer(mars_top_right_y) rescue false
    result
  end

  def take_grid_coordinates
    mars_top_right_x, mars_top_right_y = gets.chomp.split(' ')
    raise ArgumentError, 'Invalid mars_grid coordinates' unless \
      input_grid_valid?(mars_top_right_x, mars_top_right_y)
    @grid = MarsGrid.new(mars_top_right_x.to_i, mars_top_right_y.to_i)
  end

  def process_rovers
    STDIN.each_slice(2).each_with_index do |lines, index|
      rover_x, rover_y, rover_face = lines[0].split

      unless @grid.valid?(rover_x.to_i, rover_y.to_i, rover_face.to_s)
        puts 'Invalid mars_rover co-ordinates/heading: ' \
             "(#{rover_x}, #{rover_y}, #{rover_face})"
        next
      end

      @rover = MarsRover.new(index, rover_x.to_i, rover_y.to_i, rover_face.to_s)

      catch :invalid_instruction do
        lines[1].chomp.each_char do |instruction|
          throw :invalid_instruction unless process_instruction(instruction)
        end
      end

      next unless @rover.id != -1
      @rover.print_current_location
    end
  end

  def process_instruction(instruction)
    case instruction
    when 'L'
      @rover.rotate_left
    when 'M'
      @rover.move
    when 'R'
      @rover.rotate_right
    else
      puts "Error: Invalid instruction '#{instruction}'. " \
           'Valid instructions: L, M, R'
      @rover.id = -1
      return false
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  solution = Solution.new
  solution.take_grid_coordinates
  solution.process_rovers
end
