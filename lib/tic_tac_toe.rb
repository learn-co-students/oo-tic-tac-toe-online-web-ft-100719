require 'pry'
class TicTacToe

  WIN_COMBINATIONS= [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [6,4,2]
  ]

  def initialize(board=Array.new(9," "))
    @board=board
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input_integer=input.to_i
    input_integer-=1
  end

  def move(index, string="X")
    @board[index]=string
  end

  def position_taken?(index)
     if @board[index]=="X" || @board[index]=="O"
       return true
     else
       return false
     end
  end

  def valid_move?(input)
    if !self.position_taken?(input) && input.between?(0,8)
      return true
    end
  end

  def turn_count
    @board.count {|turn| turn=="X"||turn=="O"}
  end

  def current_player
    self.turn_count%2==0 ? "X" : "O"
  end

  def turn
    input=gets.strip
    index= self.input_to_index(input)
    if self.valid_move?(index)
      self.move(index, self.current_player)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.each do |combo| 
      if @board[combo[0]] != " " && @board[combo[0]]  == @board[combo[1]] && @board[combo[1]]  == @board[combo[2]] 
        return combo
      end 
    end  
    false
  end
  
  def full? 
    @board.all? { |position| position != " "  }
  end 
  
  def draw?
    self.full? && !self.won?
  end 
  
  def over?
    self.draw? || self.won?
  end 
  
  def winner
    WIN_COMBINATIONS.each do |combo| 
      if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X"
         return"X"
      elsif @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
        return  "O"
    end
    end
    nil
  end
  
  def play 
    while !self.over? do
      self.turn 
    end
    
    if self.won?
      puts "Congratulations #{self.winner}!"
    elsif self.draw? 
      puts "Cat's Game!"
    end 
  end 
  

end