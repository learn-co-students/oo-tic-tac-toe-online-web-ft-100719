require "pry"

class TicTacToe
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [6,4,2]
    ]
    
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    number = input.to_i
    number-=1
  end
  
  def move(input, letter = "X")
    @board[input] = letter
  end
  
  def position_taken?(index)
    if @board[index] == "X" || @board[index] == "O"
      return true
    else
      return false
    end
  end
  
  def valid_move?(move)
    if !position_taken?(move) && move.between?(0,8)
      return true
    end
  end
  
  def turn_count
    counter = 0
    @board.each {|t| counter += 1 if ["X", "O"].include?(t)}
    counter
  end
  
  def current_player
    if turn_count.odd?
      return "O"
    else 
      return "X"
    end
  end
  
  def turn
    input=gets.chomp
    index= input_to_index(input)
    if valid_move?(index)
      move(index,current_player)
      display_board
    else
      turn
    end
  end
  
  def won?
    WIN_COMBINATIONS.each do |win_combo|
      
      index = win_combo[0]
      index1 = win_combo[1]
      index2 = win_combo[2]
      
      position1 = @board[index]
      position2 = @board[index1]
      position3 = @board[index2]
      
      if position1 == position2 && position2 == position3 && (position1 == "X" || position1 == "O")
        return win_combo
      end
    end
    return false
  end
  
  def full?
    if @board.all? {|t| t=="X" || t=="O"}
      return true
    else
      return false
    end
  end
  
  def draw?
    !won? && full?
  end
  
  def over?
    if draw? || won?
      return true
    else
      return false
    end
  end
  
  def winner
    
    if won?
      winner_combo = won?
    end
    
    if won? && @board[winner_combo[0]] == "X"
      return "X"
    elsif won? && @board[winner_combo[0]] == "O"
      return "O"
    end
  end
  
  def play
    until over?
    turn
    end
    
    if over? && won?
      if winner == "X"
        puts "Congratulations X!"
      elsif winner = "O"
        puts "Congratulations O!"
      end
    elsif over? && draw?
      puts "Cat's Game!"
    end
  end
      
  
  
end