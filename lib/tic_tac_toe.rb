require 'pry'
class TicTacToe
  WIN_COMBINATIONS=[
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]
  def initialize
    @board=[" "," "," "," "," "," "," "," "," "]
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    puts "-----------"
  end
  def input_to_index(user_input)
    user_input.to_i-1
  end

  def move(index,token)
    @board[index]=token
  end

  def position_taken?(position)
    @board[position]!=" "  #true : false
  end

  def valid_move?(position)
   !position_taken?(position) && position>=0 && position<=8
  end

  def turn_count
    @board.count {|char| char !=" "}
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def turn
    input=gets.strip
    position=input_to_index(input)
    if valid_move?(position)
      move(position,current_player)
      display_board
    else
      turn
    end
  end
end
