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
      ----------------------------------------------------------------------------
    HEREDOC
  end

  def self.game_loop
    code = Computer.make_code
    12.times do
      guess = Player.guess
      print_guess(guess)
      print_hint(guess, code)
      if correct_guess?(guess, code)
        puts "You figured out the code! It was #{code}."
        break
      end
    end
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
    display = []
    # already_seen = []
    code_array = code.chars
    guess.each_char.with_index do |char, index|
      if code_array[index] == char
        display.push(CORRECT_NUMBER_AND_PLACE)
      elsif code_array.include?(char)
        display.push(CORRECT_NUMBER)
      end
    end
    print "#{display.shuffle.sort.join(' ')}\n"
  end

  def self.correct_guess?(guess, code)
    guess.to_i == code.to_i
  end

  def self.restart_or_end_game
  end

  private

  attr_accessor :code

  private_class_method :print_guess, :print_hint
end
