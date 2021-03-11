# frozen_string_literal: true

require 'colorize'
require_relative 'game'
require_relative 'computer'

def main
  puts ' Mastermind '.colorize(color: :black, background: :white)
  Game.rules
  game = Game.new
end

main
