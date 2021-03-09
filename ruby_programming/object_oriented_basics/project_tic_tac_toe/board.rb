# frozen_string_literal: true

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

  # def update(player, square)
  #   @configuration.each do |row|
  #     p @configuration
  #   end
  # end
end
