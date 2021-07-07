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
    @board.count {|token| token=="X"||token=="O"}
  end

  def current_player
    self.turn_count%2==0 ? "X" : "O"
  end

  def turn
    input=gets
    index= self.input_to_index(input)
    if self.valid_move?(index)
      self.move(index, self.current_player)
      display_board
    else
      turn
    end
  end

  def won?
    
    WIN_COMBINATIONS.each do |win_combo|
     combo = win_combo[0] 
     combo1 = win_combo[1]
     combo2 = win_combo[2]
     
     position1 = @board[combo]
     position2 = @board[combo1]
     position3 = @board[combo2]
    if (position1 == "X" && position2 =="X" && position3 =="X") || (position1 == "O" && position2 =="O" && position3 =="O")
        return win_combo
    end
    end
      return false
  end
  
  def full?
    @board.all?{|string| string == "X" || string == "O"}
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
    winners_combo = []
    winners_combo = won?
    
    if winners_combo == false
      return nil
    else
      if @board[winners_combo[0]] == "X" 
        return "X"
      else 
        return "O"
      end
    end
  end
  
   def play
    until over? == true
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
     elsif draw?
      puts "Cat's Game!"
    end
   end
  end
    