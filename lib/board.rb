# frozen_string_literal: true
require_relative 'node'

class Board
  @@moves = [[2, 1], [2, -1], [1, -2], [-1, -2], [-2, 1], [-2, -1], [1, 2], [-1, 2]]

  attr_accessor :origin

  def initialize
    @origin = Node.new([1, 1])
    generate([origin])
  end

  def generate(queue)
    return if queue.empty?
    node = queue.shift
    @@moves.each do |move|
      square = generate_move(node, move)
      queue.push(square) if square.is_a?(Node)
    end
    generate(queue)
  end

  def generate_move(node, move)
    new_position = calculate(node.position, move)
    return unless legal_move?(new_position)
    square = search([origin], new_position)
    square ? square_assign(node, square) : square_generate(node, new_position)
  end

  def square_assign(node, square)
    node.neighbours.push(square)
    node.neighbours.uniq!
    square.neighbours.push(node)
    square.neighbours.uniq!
  end

  def square_generate(node, position)
    square = Node.new(position)
    node.neighbours.push(square)
    node.neighbours.uniq!
    square.neighbours.push(node)
    square.neighbours.uniq!
    square
  end

  def search(queue, position, visited = [])
    return if queue.empty?
    node = queue.shift
    return node if node.position == position
    new_queue = node.neighbours.filter {|node| true unless visited.include?(node)}
    queue += new_queue
    visited.push(node)
    search(queue, position, visited)
  end

  def search_path(queue, position, visited = [], path = [])
    return path if queue.empty?
    node = queue.shift
    p node.position
    return path.push(position) if node.position == position
    node.neighbours.each do |neighbour|
      if neighbour.position == position
        path.push(position)
        puts "found. #{path}"
        return path.push(node.position)
      end
    end
    queue_plus = node.neighbours.filter {|node| true unless visited.include?(node)}
    queue += queue_plus
    visited.push(node)
    path = search_path(queue, position, visited)
    path.push(node.position) if path != []
  end

  def mark_parents(start, last)
    start.parent = nil
    queue = [start]
    visited = []
    until queue.empty?
      node = queue.shift
      visited << node
      node.neighbours.each do |neighbour|
        neighbour.parent = node unless visited.include?(neighbour)
        break queue.clear if neighbour.position == last
        queue << neighbour
        visited << neighbour
      end
    end
  end

  def calculate(position, move)
    [position[0] + move[0], position[1] + move[1]]
  end

  def legal_move?(position)
    position[0].between?(1, 8) && position[1].between?(1, 8)
  end

  def get_parents(node)
    path = []
    current = node
    until current == nil
      current
      path << current.position
      current = current.parent
    end
    path
  end

  def knight_move(start, last)
    mark_parents(search([origin], start), last)
    path =  get_parents(search([origin], last))
    puts "You made it in #{path.size} moves! Heres your path:"
    path.each {|n| p n}
  end
end
