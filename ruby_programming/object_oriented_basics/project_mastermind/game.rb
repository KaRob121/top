# frozen_string_literal: true

# Mastermind game class
class Game
  CODE_PEG1 = '  1  '.colorize(background: :green)
  CODE_PEG2 = '  2  '.colorize(background: :red)
  CODE_PEG3 = '  3  '.colorize(background: :blue)
  CODE_PEG4 = '  4  '.colorize(background: :magenta)
  CODE_PEG5 = '  5  '.colorize(background: :cyan)
  CODE_PEG6 = '  6  '.colorize(color: :black, background: :yellow)
  CORRECT_NUMBER = '◯'
  CORRECT_NUMBER_AND_PLACE = '🔴'

  def initialize
    @code = Computer.make_code
  end

  def self.rules
    puts "\nWelcome to Mastermind!" \
         "\nIn this game, the goal is to break a random 4-digit code created by the computer. " \
         "This code consists 4 of the following numbers:\n" \
         "#{CODE_PEG1}#{CODE_PEG2}#{CODE_PEG3}#{CODE_PEG4}#{CODE_PEG5}#{CODE_PEG6}" \
         "\n\nAn example code is:\n" \
         "#{CODE_PEG3}#{CODE_PEG2}#{CODE_PEG1}#{CODE_PEG3}" \
         "\n*Note that a number can be repeated in the code, such as #{CODE_PEG3} in the example above." \
         "\n\nYou have 12 chances at breaking the code. " \
         'After each guess, you will be given hints on how close you are to the correct answer. ' \
         "\nFor each correct number in the correct spot, a #{CORRECT_NUMBER_AND_PLACE}  will be printed out. " \
         "If you have a correct number, but in the wrong spot, a #{CORRECT_NUMBER}  will be printed out." \
         "\nGood luck!" \
         "\n----------------------------------------------------------------------------\n"
  end

  private

  attr_accessor :code
end
