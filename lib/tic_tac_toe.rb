class TicTacToe
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8], #bottom row
  [0,3,6],  #left column
  [1,4,7],  #middle column
  [2,5,8],  #right colunm
  [0,4,8],  #diag-left-right
  [2,4,6]  #diag-Right-Left
  ]

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
  
  def move(square, token = "X")
    @board[square] = token
  end
  
  def position_taken?(index_val)
    if @board[index_val] == "X" || @board[index_val] == "O"
      TRUE
    else
      FALSE
    end
  end
  
  def valid_move?(square)
    if square.between?(0,8) && !position_taken?(square)
      true
    else
      false
    end
  end
  
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    char = current_player
    if valid_move?(index)
      move(index, char)
      display_board
    else
      turn
    end
end
  
  def turn_count
    count = 0 
    @board.each do |i|
      if i == "X" || i == "O"
        count += 1 
      end
                                                  #count -- wrong bloody spot lol
    end
    count
  end
  
  def current_player
    if turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end
  
  def won?
    
    board_empty = @board.none? { |i| i == "X" || i = "O"}
    if board_empty
      false
    else 
      WIN_COMBINATIONS.each do |combo| 
        if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X" || @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
          return combo
        end
      end
      return false
    end
    
  end
  
  def full?
    @board.all? { |i| i =="X" || i == "O"}
  end

  def draw?
    !won? && full? ? true : false
  end

  def over?
    won? || draw? || full? ? true : false
  end
  
  def winner
    WIN_COMBINATIONS.detect do |combo| 
          if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X" 
            return "X"
          elsif @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
            return "O"
          else 
            nil
          end
    end
  end
  
  
  def play
    while over? === false
      turn
    end
    

    if won? 
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
  
end