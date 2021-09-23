# frozen_string_literal: true

require_relative 'game'

# Player class
class Player < Game
  def self.choose_role
    puts <<~HEREDOC
      What role do you want to play?

      1) Codebreaker: You need to break the computer's code.
      2) Codemaker: You will create a code for the computer to break.

      Type 1 (codebreaker) or 2 (codemaker):
    HEREDOC
    role = gets.chomp.to_i
    raise InvalidRoleError unless valid_role?(role)

    role
  end

  def self.valid_role?(role)
    valid_roles = [1, 2]
    valid_roles.include?(role)
  end

  def self.guess(turn)
    print "\nTurn #{turn}: "
    print "What is your guess?\n"
    guess = gets.chomp
    raise InvalidGuessError unless valid_guess_length?(guess) && valid_guess_content?(guess)
  rescue InvalidGuessError => e
    puts e
    retry
  else
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
