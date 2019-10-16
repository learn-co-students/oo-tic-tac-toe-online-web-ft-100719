class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
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

    def move(index, first_player = "X")
      @board[index] = first_player
    end

  def position_taken?(index)
    # BOTH THE LINES OF CODE BELOW WORK ON THEIR OWN BUT I'M AVOIDING THE BANG METHOD
    # !(@board[index].nil? || @board[index] == " ")
    # !(@board[index] == " ")
    if @board[index].nil? || @board[index] == " "
      false
    else
      true
    end
  end

  def valid_move?(index)
    index.between?(0, 8) && position_taken?(index) == false
  end

  def turn_count
   @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    puts "Please select a number between 1 - 9"
    user_input = gets
    index = input_to_index(user_input)
    if valid_move?(index)
      x_or_o = current_player
      move(index, x_or_o)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.each {|winning_combo|
      win_index_0 = winning_combo[0]
      win_index_1 = winning_combo[1]
      win_index_2 = winning_combo[2]

      pos_1 = @board[win_index_0]
      pos_2 = @board[win_index_1]
      pos_3 = @board[win_index_2]

      if pos_1 == "X" && pos_2 == "X" && pos_3 == "X"
        return winning_combo
      elsif pos_1 == "O" && pos_2 == "O" && pos_3 == "O"
        return winning_combo
      end
      }
    false
  end

  def full?
    @board.all? {|index| index == "X" || index == "O"}
  end

  def draw?
    if !won? && full?
      true
    else
      false
    end
  end

  def over?
    if won? || draw?
      true
    else
      false
    end
  end

  def winner
    index = won?
    if index == false
      nil
    else
      if @board[index[0]] == "X"
        "X"
      else
        "O"
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
