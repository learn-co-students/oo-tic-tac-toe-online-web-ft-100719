require 'pry'

class TicTacToe
  
  attr_accessor :input
  attr_reader :index,:board, :x_wins, :o_wins
  
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
    @index=input.to_i-1
  end
  
  def move(index,token="X")
    @board[index]=token
  end
  
  def position_taken?(index)
    if @board[index]==" "
      false
    else
      true
    end
  end
  
  def valid_move?(index)
    if index.between?(0,8) && !position_taken?(index)
      true
    else
      false
    end
  end
  
  def turn
    puts "Choose a space between 1 and 9."
    input=gets.chomp
    index= input_to_index(input)
    
    if valid_move?(index)
      move(index,current_player)
    else
      turn
    end
    display_board
  end
  
  def turn_count
    @board.count{|token| token== "X" || token=="O"}
  end
  
  def current_player
    if turn_count%2==0
      "X"
    else
      "O"
    end
  end
  
  def won?
    @x_wins= WIN_COMBINATIONS.detect do |combo| 
        @board[combo[0]]=="X" && @board[combo[1]]=="X" && @board[combo[2]]=="X"
      end
    @o_wins= WIN_COMBINATIONS.detect do |combo| 
        @board[combo[0]]=="O" && @board[combo[1]]=="O" && @board[combo[2]]=="O"
      end
    if @x_wins
      @x_wins
    elsif @o_wins
      @o_wins
    else
      false
    end
  end
  
  def full?
    turn_count==9
  end
  
  def draw?
    full? && !won?
  end
  
  def over?
    draw? || won?
  end
  
  def winner
    winner=nil
    ##ORIGINAL IDEA
    # WIN_COMBINATIONS.each do |combo|
    #   if @x_wins==combo
    #     winner= "X"
    #   elsif [@o_wins]==combo
    #     winner= "O"
    #   else
    #   nil
    #   end
    # end
    # winner
    if won?
      if @board[won?[0]]=="X"
       winner= "X"
      else
        winner= "O"
      end
    end
    winner
  end
  
  def play
    turn until over?
    if won? 
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
  
end