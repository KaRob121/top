# frozen_string_literal: true

require_relative 'player'
require_relative 'board'
require_relative 'invalid_square_error'

def restart_or_end(scenario)
  case scenario
  when -1
    puts 'Uh oh! No one won. Try again?'
  end
end

puts 'Tic Tac Toe'

puts "\nEnter the name of Player 1:"
player1 = Player.new(gets.chomp)
puts "Hello, #{player1.name}!"

puts "\nEnter the name of Player 2:"
player2 = Player.new(gets.chomp)
puts "Hello, #{player2.name}!"

if [player1, player2].sample == player1
  player1.turn = 1
  player1.piece = 'X'
  player2.turn = 2
  player2.piece = 'O'
else
  player1.turn = 2
  player1.piece = 'O'
  player2.turn = 1
  player2.piece = 'X'
end

board = Board.new

turn = 1
loop do
  if turn.odd? && player1.turn.odd? || turn.even? && player1.turn.even?
    current_player = player1
  elsif turn.odd? && player2.turn.odd? || turn.even? && player2.turn.even?
    current_player = player2
  end

  puts "\nIt's #{current_player.name}'s turn! You are #{current_player.piece}."
  board.show_board
  begin
    puts 'Enter a number from 1 to 9 where you want to place your piece:'
    board.update(current_player, gets.chomp.to_i)
  rescue InvalidSquareError => e
    puts 'You can\'t place your piece there!'
    retry
  end

  if board.full?
    restart_or_end(-1)
    break
  end
  turn += 1
end
