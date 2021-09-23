# frozen_string_literal: true

require 'colorize'
require_relative 'game'
require_relative 'computer'
require_relative 'player'
require_relative 'errors'

def print_contact_info
  puts <<~HEREDOC
    \nThanks for playing Mastermind!
    Made by Karl Espinosa for The Odin Project
    (The UX/UI of this program is inspired by rlmoser from The Odin Project)

  HEREDOC
end

role = Game.setup_game
case role
when 1
  puts 'You are the codebreaker.'
  puts '----------------------------------------------------------------------------'
  Game.game_loop # game loop for player as codebreaker
when 2
  Game.game_loop # game loop for player as codemaker
end
print_contact_info
