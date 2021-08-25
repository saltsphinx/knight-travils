# frozen_string_literal: true
require_relative 'node'

class Board
  @@moves = [[2, 1], [2, -1], [1, -2], [-1, -2], [-2, 1], [-2, -1], [1, 2], [-1, 2]]

  attr_accessor :origin

  def initialize
    @origin = Node.new([1, 1])
    generate([origin])
  end

  def generate(queue, count = 1)
    return puts count if queue.empty?
    node = queue.shift
    @@moves.each do |move|
      new_position = calculate(node.position, move)
      next unless legal_move?(new_position)
      square = search([origin], new_position)
      if square
        node.neighbours.push(square)
        node.neighbours.uniq!
        square.neighbours.push(node)
        square.neighbours.uniq!
      else
        count += 1
        square = Node.new(new_position)
        queue.push(square)
        node.neighbours.push(square)
        node.neighbours.uniq!
        square.neighbours.push(node)
        square.neighbours.uniq!
      end
    end
    generate(queue, count)
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

  def calculate(position, move)
    [position[0] + move[0], position[1] + move[1]]
  end

  def legal_move?(position)
    return false if position[0] < 1 || position[1] < 1 || position[0] > 8 || position[1] > 8
    true
  end

  def knight_move(start, last)

  end
end
