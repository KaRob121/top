# frozen_string_literal: true

require_relative 'invalid_square_error'

# Tic Tac Toe Board class
class Board
  def initialize
    @configuration = [(1..3).to_a, (4..6).to_a, (7..9).to_a]
  end

  def show_board
    puts '-----------'
    @configuration.each do |row|
      puts " #{row.join(' | ')}"
      puts '-----------'
    end
  end

  def update(player, square)
    found_square = false
    @configuration.each do |row|
      if row.include?(square)
        found_square = true
        row[row.index(square)] = player.piece
      end
    end
    raise InvalidSquareError unless found_square == true
  end

  def full?
    @configuration.flatten.count('X') + @configuration.flatten.count('O') == 9
    # case @configuration
    # in [['X', 'X', 'X'], *]
  end

  # def winning?
end
