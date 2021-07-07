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
    puts "Please enter 1-9"
    input=gets.strip
    position=input_to_index(input)
    if valid_move?(position)
      move(position,current_player)
      display_board
    else
      turn
    end
  end
  def won?
    WIN_COMBINATIONS.detect do |combos|
      if @board[combos[0]]=="X" && @board[combos[1]]=="X" && @board[combos[2]]=="X"
        @winner="X"
        combos
      elsif @board[combos[0]]=="O" && @board[combos[1]]=="O" && @board[combos[2]]=="O"
        @winner="O"
        combos
      else
        @winner=nil
      end
    end
  end

  def full?
    @board.all? {|position| position != " "}
  end

  def draw?
    !won? && full?
  end

  def over?
    draw? || won?
  end

  def winner
    if won?
      @winner
    end
  end

  def play
    while !over?
      display_board
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
end
