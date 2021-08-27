class Node
  attr_accessor :position, :neighbours, :parent
  def initialize(position, passes = 0)
    @position = position
    @neighbours = []
    @parent = nil
  end

  def neighbour_positions
    neighbours.map {|node| node.position}
  end
end