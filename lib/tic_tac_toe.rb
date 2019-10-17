class TicTacToe
  
  WIN_COMBINATIONS = [ [0,1,2],
                     [3,4,5],
                     [6,7,8],
                     [0,3,6],
                     [1,4,7],
                     [2,5,8],
                     [0,4,8],
                     [2,4,6]
    ]
    
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end #initialize
 
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end #current_player
 
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end #turn_count
 
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end #display_board
  
  def input_to_index(user_input)
    user_input.to_i - 1 
  end #input_to_index
  
  def move(index, token = 'X')
    @board[index] = token
  end #move
  
  def position_taken?(index)
    @board[index] != " "
  end #position_taken?
  
  def valid_move?(index)    
    index.between?(0,8) && 
     !position_taken?(index)
  end #valid_move
  
  def turn 
    
    user_input = gets.chomp
    index = input_to_index(user_input)
    while !valid_move?(index) do
      user_input = gets.chomp
      index = input_to_index(user_input)
    end
      
    move(index, current_player)
    display_board
  end #turn
  
  
  def won?
    WIN_COMBINATIONS.each do |combination|
      index1 = combination[0]
      index2 = combination[1]
      index3 = combination[2] 
      if (@board[index1] != " ") && 
        (@board[index1] == @board[index2]) && 
        (@board[index2] == @board[index3])
        return combination
      end #if
    end #each
    return FALSE
  end
  
  def full?
    !@board.include?(" ") 
  end
    
  def draw?
    won? ? FALSE : full? 
  end
  
  def over?
    won? || draw? ? TRUE : FALSE
  end
  
  def winner
    if (winning_combo = won?)
      @board[winning_combo[0]]
    end
  end
  
  def play 
    while !over? do
      turn
    end 
    
    if who_won = winner 
       puts "Congratulations #{who_won}!"
    elsif draw?
      puts "Cat's Game!"
    end #if
        
  
 end #play
end #TicTacToe
