# frozen_string_literal: true

require_relative 'game'

# Player class
class Player < Game
  def self.guess
    puts "\nWhat is your guess?"
    gets.chomp
  end
end
