require 'pry'

class TicTacToe
  WIN_COMBINATIONS = [
    [0, 1, 2], #top row
    [3, 4, 5], #middle row
    [6, 7, 8], #bottom row
    [0, 3, 6], #first column
    [1, 4, 7], #second column
    [2, 5, 8], #third column
    [0, 4, 8], #top left to bottom right diagonal
    [2, 4, 6] #top right to bottom left diagonal
  ]

  def initialize
    @board = Array.new(9, " ")
  end

  def display_row(row)
    puts " #{row[0]} | #{row[1]} | #{row[2]} "
  end

  def display_line
    puts "-----------"
  end

  def display_board
    display_row(@board[0..2])
    display_line
    display_row(@board[3..5])
    display_line
    display_row(@board[6..8])
  end

  def input_to_index(input)
    input.strip.to_i - 1
  end

  def move(index, token = "X")
    if (token == "X" || token == "O")
      @board[index] = token
    end
  end

  def position_taken?(index)
    @board[index] != " "
  end

  def valid_move?(index)
    !position_taken?(index) && (index >= 0 && index <= 8)
  end

  def turn
    puts "Where would you like to move? (Enter 1-9):"
    user_input = gets
    user_input = input_to_index(user_input)
    if  valid_move?(user_input)
      token =  current_player
      move(user_input, token)
      display_board
    else
      turn
    end
  end

  def turn_count
    @board.reduce(0) do |turn, position|
      turn += 1 if position != " "
      turn
    end
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def winning_combo?(combination)
    ( combination.all?{|position| @board[position] == 'X'} ||
      combination.all?{|position| @board[position] == 'O'} )
  end

  def won?
    winner = nil
    WIN_COMBINATIONS.each do |combination|
      winner = combination if winning_combo?(combination)
    end
    winner
  end

  def full?
    @board.all?{|position| position != " "}
  end

  def draw?
    full? && !won?
  end

  def over?
    draw? || !!won?
  end

  def winner
    if !!won?
      @board[won?[0]]
    else
      nil
    end
  end

  def play
    until over?
      turn
    end
    if !!won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end
