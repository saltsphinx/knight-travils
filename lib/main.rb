require_relative 'board'

board = Board.new
board.knight_move([3,3],[4,3])
board.knight_move([3,2],[4,3])
board.knight_move([3,1],[4,3])
board.knight_move([3,3],[4,5])
board.knight_move([3,3],[4,6])
board.knight_move([1,1],[8,8])