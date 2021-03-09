# frozen_string_literal: true

# Tic Tac Toe Player Class
class Player
  attr_reader :name
  attr_accessor :turn, :piece

  def initialize(name)
    @name = name
    @turn = nil
    @piece = nil
  end
end
