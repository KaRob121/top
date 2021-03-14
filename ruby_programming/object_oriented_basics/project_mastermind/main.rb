# frozen_string_literal: true

require 'colorize'
require_relative 'game'
require_relative 'computer'
require_relative 'player'
require_relative 'errors'

Game.setup_game
Game.game_loop
Game.restart_or_end_game
