class TicTacToe
  
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
  
  
  
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
  
  def input_to_index(choice)
    num = choice.to_i
    num = num - 1 
    num
  end
  
  def move(index, token = "X")
    @board[index] = token
  end
  
  def position_taken?(index)
    if @board[index] == " "
      false
    else 
      true 
    end
  end
  
  def valid_move?(index)
    if (0..8).include?(index) && position_taken?(index) == false
      true 
    else 
      false
    end
  end
  
  def turn 
    puts "Please enter a position 1-9:"
    input = gets
    new_input = input_to_index(input)
    if valid_move?(new_input)
      move(new_input, current_player)
      display_board
    else 
      puts "Move was not valid, please try again."
      turn
    end
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
 
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
  
  def won?
    winning_combo = []
    WIN_COMBINATIONS.each do |groups|
      x_count = 0 
      o_count = 0
      groups.each do |indices|
        if @board[indices] == "X"
          x_count += 1 
        elsif @board[indices] == "O" 
          o_count += 1 
        end 
          
        if x_count == 3 || o_count == 3 
          winning_combo = groups 
          return groups
        end
      end
    end
    false
  end
  
  def won_player
    winning_combo = []
    WIN_COMBINATIONS.each do |groups|
      x_count = 0 
      o_count = 0
      groups.each do |indices|
        if @board[indices] == "X"
          x_count += 1 
        elsif @board[indices] == "O" 
          o_count += 1 
        end 
          
        if x_count == 3
          return "X"
        elsif o_count == 3 
          return "O"
        end
      end
    end
    false
  end
  
  def full?
    is_full = true
    @board.each do |index|
      if index == " "
        is_full = false 
      end
    end
    is_full
  end
  
  def draw?
    player_won = false 
    if won? != false 
      player_won == true 
    end
    if won? == false && full? == true 
      true
    elsif player_won == true && full? == false 
      false
    elsif player_won == true && full? == true
      false
    elsif player_won == false && full? == false
      false
    end
  end
  
  def over?
    player_won = false 
    if won? != false 
      player_won == true 
    end
    if won? != false || draw? == true 
      true 
    else 
      false 
    end
  end
  
  def winner
    if won_player == "X"
      "X"
    elsif won_player == "O"
      "O"
    elsif draw? == true || over? == false
      nil 
    end 
  end
  
  def play 
    until over? do 
      turn
      if won? != false
        break 
      end
    end
    
    player_won = false 
    WIN_COMBINATIONS.each do |combo|
      if won? == combo
        player_won == true
      end
    end
    if won_player == "X" || won_player == "O"
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
    
end
