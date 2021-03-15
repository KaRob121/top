# frozen_string_literal: true

require_relative 'game'

# Player class
class Player < Game
  def self.guess
    print "What is your guess?\n"
    guess = gets.chomp
    raise InvalidGuessError unless valid_guess_length?(guess) && valid_guess_content?(guess)

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
