# frozen_string_literal: true

require_relative './lib/coordinate'
require_relative './lib/chessboard'

chessboard = Chessboard.new
chessboard.knight_moves([0, 0], [1, 2])
chessboard.knight_moves([3, 3], [4, 3])
chessboard.knight_moves([0, 0], [3, 3])
chessboard.knight_moves([3, 3], [0, 0])
chessboard.knight_moves([0, 0], [7, 7])
chessboard.knight_moves([0, 0], [5, 5])
