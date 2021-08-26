class Node
  attr_accessor :position, :neighbours, :passes
  def initialize(position, passes = 0)
    @position = position
    @neighbours = []
  end

  def neighbour_positions
    p neighbours.map {|node| node.position}
  end
end