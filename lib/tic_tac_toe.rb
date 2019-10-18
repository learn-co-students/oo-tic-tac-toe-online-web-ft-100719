#!/usr/bin/env ruby
require 'pry'
require_relative '../lib/tic_tac_toe.rb'

class TicTacToe

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, token = "X")
    @board[index] = token
  end

  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O" ? true : false
  end

  def valid_move?(index)
    !position_taken?(index) && index.between?(0, 8) ? true : false
  end

  def turn_count
    @board.each_with_index.select { |e, i| position_taken?(i) }.size
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    puts "Please select a number between 1 and 9."
    user_input = input_to_index(gets.chomp)
    until valid_move?(user_input) do
      user_input = input_to_index(gets.chomp)
    end
    @board[user_input] = current_player
    display_board
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      if combo.all? { |index| @board[index] == "X" }
        return combo
      elsif combo.all? { |index| @board[index] == "O" }
        return combo
      end
    end
    false
  end

  def full?
    turn_count == 9 ? true : false
  end

  def draw?
    full? && !won? ? true : false
  end

  def over?
    won? || draw? ? true : false
  end

  def winner
    if won?
      current_player == "X" ? "O" : "X"
    end
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end
