require_relative 'coordinate'

class Board
  attr_accessor :coordinates

  def initialize(size = 8)
    @board = generate_board(size)
  end

  def generate_board(size)
    @coordinates = []
    size.times.each do |x|
      size.times.each do |y|
       coordinates.push([[x + 1, y + 1], Coordinate.new([x + 1, y + 1])])
      end
    end
    puts coordinates.size
  end
end