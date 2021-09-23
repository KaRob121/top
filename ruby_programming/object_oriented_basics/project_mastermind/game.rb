# frozen_string_literal: true

require 'pry-byebug'

# Mastermind game class
class Game
  CODE_PEG1 = '  1  '.colorize(background: :green)
  CODE_PEG2 = '  2  '.colorize(background: :red)
  CODE_PEG3 = '  3  '.colorize(background: :blue)
  CODE_PEG4 = '  4  '.colorize(background: :magenta)
  CODE_PEG5 = '  5  '.colorize(background: :cyan)
  CODE_PEG6 = '  6  '.colorize(color: :black, background: :yellow)
  CORRECT_NUMBER = '●'
  CORRECT_NUMBER_AND_PLACE = '●'.colorize(color: :red)
  VALID_GUESS_CHARS = %w[1 2 3 4 5 6].freeze

  def self.setup_game
    puts ' Mastermind '.colorize(color: :black, background: :white)
    rules
    Player.choose_role
  end

  def self.rules
    puts <<~HEREDOC

      Welcome to Mastermind!

      In this game, the goal is to break your opponent's random 4-digit code.
      This code consists 4 of the following numbers:
      #{CODE_PEG1} #{CODE_PEG2} #{CODE_PEG3} #{CODE_PEG4} #{CODE_PEG5} #{CODE_PEG6}

      An example code is:
      #{CODE_PEG3} #{CODE_PEG2} #{CODE_PEG1} #{CODE_PEG3}
      *Note that a number can be repeated in the code, such as #{CODE_PEG3} in the example above.

      You can choose to either break the computer's secret code or create a secret code for the computer to break.
      The code breaker will have 12 guesses to break the code.
      After each guess, they will be given hints on how close they are to the correct answer.
      For each correct number in the correct spot in the guess, a  #{CORRECT_NUMBER_AND_PLACE}  will be printed out.
      If there is a correct number in the guess, but in the wrong spot, a  #{CORRECT_NUMBER}  will be printed out.

      Good luck!

    HEREDOC
  end

  def self.game_loop
    code = Computer.make_code
    # code = 2363.to_s
    12.times do |turn|
      guess = Player.guess(turn + 1)
      print_guess(guess)
      print_hint(guess, code)
      break if correct_guess?(guess, code)

      puts "The code was #{code}! Better luck next time." if turn + 1 == 12
    end
    restart_or_end_game
  end

  def self.print_guess(guess)
    guess.each_char do |char|
      case char
      when '1' then print "#{CODE_PEG1} "
      when '2' then print "#{CODE_PEG2} "
      when '3' then print "#{CODE_PEG3} "
      when '4' then print "#{CODE_PEG4} "
      when '5' then print "#{CODE_PEG5} "
      when '6' then print "#{CODE_PEG6} "
      end
    end
  end

  def self.print_hint(guess, code)
    hint = determine_hint(guess.split(''), code.split(''), [])
    print "#{hint.sort.join(' ')}\n"
  end

  def self.determine_hint(guess_arr, code_arr, hint)
    guess_arr.each_with_index do |char, index|
      if code_arr[index] == char
        hint.push(CORRECT_NUMBER_AND_PLACE)
        code_arr[index] = '-'
        # puts "RED"
      elsif code_arr.include?(char) && code_arr[code_arr.index(char)] != guess_arr[code_arr.index(char)]
        hint.push(CORRECT_NUMBER)
        code_arr[code_arr.index(char)] = '-'
        # puts "WHITE"
      end
    end
    # puts code_arr
    hint
  end

  def self.correct_guess?(guess, code)
    puts "You figured out the code! It was #{code}." if guess.to_i == code.to_i
    guess.to_i == code.to_i
  end

  def self.restart_or_end_game
    puts "\nDo you want to play again? Type y for yes or n for no."
    choice = gets.chomp
    case choice.downcase
    when 'y'
      game_loop
    end
  end

  private

  attr_accessor :code
end
