# frozen_string_literal: true

require_relative 'game'

# Player class
class Player < Game
  def self.guess
    puts "\nWhat is your guess?"
    guess = gets.chomp
    raise InvalidGuessLengthError unless valid_guess_length?(guess)
    raise InvalidGuessContentError unless valid_guess_content?(guess)

    guess
  end

  def self.valid_guess_length?(guess)
    guess.length == 4
  end

  def self.valid_guess_content?(guess)
    guess.each_char do |char|
      return false unless VALID_GUESS_CHARS.include?(char)
    end
  end
end
