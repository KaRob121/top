# frozen_string_literal: true

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
  end

  def self.rules
    puts <<~HEREDOC

      Welcome to Mastermind!

      In this game, the goal is to break a random 4-digit code created by the computer.
      This code consists 4 of the following numbers:
      #{CODE_PEG1} #{CODE_PEG2} #{CODE_PEG3} #{CODE_PEG4} #{CODE_PEG5} #{CODE_PEG6}

      An example code is:
      #{CODE_PEG3} #{CODE_PEG2} #{CODE_PEG1} #{CODE_PEG3}
      *Note that a number can be repeated in the code, such as #{CODE_PEG3} in the example above.

      You have 12 chances at breaking the code.
      After each guess, you will be given hints on how close you are to the correct answer.
      For each correct number in the correct spot, a  #{CORRECT_NUMBER_AND_PLACE}  will be printed out.
      If you have a correct number, but in the wrong spot, a  #{CORRECT_NUMBER}  will be printed out.

      Good luck!
    HEREDOC
  end

  def self.game_loop
    puts '----------------------------------------------------------------------------'
    code = Computer.make_code
    12.times do |turn|
      guess = player_guess(turn + 1)
      print_guess(guess)
      print_hint(guess, code)
      break if correct_guess?(guess, code)

      puts "The code was #{code}! Better luck next time." if turn + 1 == 12
    end
    restart_or_end_game
  end

  def self.player_guess(turn)
    print "\nTurn #{turn}: "
    guess = Player.guess
  rescue InvalidGuessError => e
    puts e
    retry
  else
    guess
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
      elsif code_arr.include?(char)
        hint.push(CORRECT_NUMBER)
        code_arr[code_arr.index(char)] = '-'
      end
    end
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
    when 'n'
      print_contact_info
      exit
    end
  end

  def self.print_contact_info
    puts <<~HEREDOC
      \nThanks for playing Mastermind!
      Made by Karl Espinosa for The Odin Project\n
    HEREDOC
  end

  private

  attr_accessor :code
end
