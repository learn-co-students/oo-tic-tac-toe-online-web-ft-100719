class TicTacToe
  
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]
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
    
    def input_to_index(move)
      index = move.to_i - 1 
      index
  end
  
  def move(index, token)
    @board[index] = token
end

def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
end

def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
    # puts "this is a valid move"
  #   return true
  # else
  #   return false
  # end
end

def turn_count
  counter = 0 
  @board.each do |game|
    if game == "X" || game == "O"
      counter += 1 
    end
  end
  counter
end

def current_player
  if turn_count%2 ==0
    current_player = "X"
  else
    current_player = "O"
end
current_player
end

def turn
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  token = current_player
  
  if valid_move?(index)
    puts "vaild move"
    move(index, token)
    display_board
  else
    puts "try again"
    turn
  end
end

def won?
  # WIN_COMBINATIONS.each do |win_combo|
  #   if (@board[win_combo[0]] == @board[win_combo[1]]) && (@board[win_combo[2]] == @board[win_combo[0]]) && @board[win_combo[0]] != " "
  #     return win_combo
  #   end
  # end
  # false
  WIN_COMBINATIONS.find{|win_combo| (@board[win_combo[0]] == @board[win_combo[1]]) && (@board[win_combo[2]] == @board[win_combo[0]]) && @board[win_combo[0]] != " "}
end

def full? 
  if @board.include?(" ") || @board.include?("")
    false
  else
    true
  end
end

def draw?
  if !won?(@board) && full?(@board)
    true
  end
end

def over?
  puts 'is it over?'
  if won?(@board) || draw?(@board) || full?(@board)
    return true
  else
    puts 'no keep going'
    return false
  end
end

def winner
  if !won?(@board)
    return nil
  else WIN_COMBINATIONS.each do |win_combo|
    if check_win_combination?(@board, 'X', win_combo)
      return 'X'
    elsif check_win_combination?(@board, 'O', win_combo)
      return 'O'
    end
  end
end
end


def play
  until over?(@board) == true || won?(@board) != false
  puts 'turn'
    turn(@board)
  end
  if winner(@board)
    puts "Congratulations!"
  elsif draw?(@board)
    puts "Draw!"
  else
    return nil
  end



end