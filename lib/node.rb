class Node
  attr_accessor :position, :neighbours, :passes
  def initialize(position, passes = 0)
    @position = position
    @neighbours = []
  end

  def display
    puts "for #{position}"
    p neighbours.map {|node| node.position}
    puts "\n"
  end
end