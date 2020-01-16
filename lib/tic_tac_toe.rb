class TicTacToe 
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
    ]
  def initialize
    @board = [" "," "," ",
              " "," "," ",
              " "," "," "]
  end
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input) 
    input.to_i - 1
  end
  
  def move(index, token = "X")
    @board[index] = token
  end
  
  def position_taken?(index)
    if @board[index] == "X" || @board[index] == "O"
      return true 
    else 
      return false 
    end
  end
  
  def valid_move?(position)
    if @board[position] == " " && position.between?(0, 8)
      return true 
    else 
      return false 
    end
  end
  
  def turn_count
    count = 0
    @board.each do |position|
      if position == "X" || position == "O"
        count += 1 
      end
    end
    count
  end
  
  def current_player
    if turn_count % 2 == 0 
      return "X"
    else 
      return "O"
    end 
  end
  
  def turn 
    puts "Please enter a move:"
    position = gets.chomp
    index = input_to_index(position)
    marker = current_player
    if valid_move?(index)
       move(index, marker)
       display_board
    else 
      turn
    end
  end
  
  def won?
    WIN_COMBINATIONS.detect do |combo| (position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]]
      && @board[combo[1]] == @board[combo[2]])
    end
  end
end