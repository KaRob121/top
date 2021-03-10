# frozen_string_literal: true

# Tic Tac Toe Player Class
class Player
  attr_reader :name
  attr_accessor :turn, :piece, :squares

  WINNING_SQUARES = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
                     [1, 4, 7], [2, 5, 8], [3, 6, 9],
                     [1, 5, 9], [3, 5, 7]].freeze

  def initialize(name)
    @name = name
    @turn = nil
    @piece = nil
    @squares = []
  end

  def set_turn_and_piece(turn, piece)
    @turn = turn
    @piece = piece
  end

  def win?
    WINNING_SQUARES.include?(@squares.sort)
  end
end
