# frozen_string_literal: true

require_relative 'player'
require_relative 'board'

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
  if turn.odd?
    puts "\nIt's #{first_turn.name} turn! You are #{first_turn.piece}."
  else
    puts "\nIt's #{second_turn.name} turn! You are #{second_turn.piece}."
  end
  board.show_board
  puts 'Enter a number from 1 to 9 where you want to place your piece:'
  # board.update(gets.chomp)

  turn += 1
end
