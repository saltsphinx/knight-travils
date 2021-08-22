class Coordinate
  attr_reader :position, :x, :y

  def initialize(array)
    @position = array
    @x = position[0]
    @y = position[1]
  end
end