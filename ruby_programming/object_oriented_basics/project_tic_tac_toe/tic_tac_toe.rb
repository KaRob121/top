# frozen_string_literal: true

require_relative 'player'
require_relative 'board'
require_relative 'invalid_square_error'

# Asks for player names, determine their turn order randomly, and starts the game
def setup_game
  puts "\nTic Tac Toe"

  puts "\nEnter the name of Player 1:"
  player1 = Player.new(gets.chomp)
  puts "Hello, #{player1.name}!"

  puts "\nEnter the name of Player 2:"
  player2 = Player.new(gets.chomp)
  puts "Hello, #{player2.name}!"

  choose_turns(player1, player2)

  board = Board.new
  loop_game(player1, player2, board)
end

# Determines the play order of the players
def choose_turns(player1, player2)
  if [player1, player2].sample == player1
    player1.set_turn_and_piece(1, 'X')
    player2.set_turn_and_piece(2, 'O')
  else
    player1.set_turn_and_piece(2, 'O')
    player2.set_turn_and_piece(1, 'X')
  end
end

# Loops until a player has won or until the board is full
def loop_game(player1, player2, board)
  turn = 1
  loop do
    current_player = current_player(turn, player1, player2)
    puts "\nIt's #{current_player.name}'s turn! You are #{current_player.piece}."
    valid_player_move(current_player, board)

    restart_or_end(-1, board) if board.full?
    restart_or_end(1, board, current_player) if current_player.win?

    turn += 1
  end
end

# Returns the player of the current turn
def current_player(turn, player1, player2)
  if turn.odd?
    player1.turn.odd? ? player1 : player2
  else
    player1.turn.even? ? player1 : player2
  end
end

# Loops until the current player has made a valid move
def valid_player_move(current_player, board)
  board.show_board
  puts 'Enter a number from 1 to 9 where you want to place your piece:'
  board.update(current_player, gets.chomp.to_i)
rescue InvalidSquareError
  puts 'You can\'t place your piece there!'
  retry
end

# Asks the player if they want to play again
def restart_or_end(scenario, board, winning_player = nil)
  board.show_board
  puts scenario.positive? ? "#{winning_player.name} won! Play again?" : 'Uh oh! No one won. Try again?'
  puts 'Enter yes or no:'
  if gets.chomp.downcase == 'no'
    puts 'Thanks for playing!'
    exit
  else
    setup_game
  end
end

setup_game
