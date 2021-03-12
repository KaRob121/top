# frozen_string_literal: true

require 'colorize'
require_relative 'game'
require_relative 'computer'
require_relative 'player'

Game.setup_game
Game.game_loop
