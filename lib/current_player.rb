
require 'pry'
def display_board board
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index input
  input = input.to_i
end

def position_taken? board, index
  if board[index.to_i - 1] != "X" and board[index] != "O"
    return false
  else
    return true
  end
end

def valid_move board, index
  index = index.to_i - 1
  if !index.between?(0,8)
    return false
  elsif position_taken?(board, index)
    return false
  else
    return true
  end
end




def turn_count board
  counter = 0
  board.each do |place|
    if place == "X" or place == "O"
      counter += 1
    end
  end
  return counter
end

def  current_player board
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end
end

    def move board, index

        board[index.to_i - 1] = current_player(board)
    end

    def turn board
      index = gets.strip
index = index.to_i - 1
      until valid_move(board, index)
        index = gets.strip
      index = index.to_i - 1
    end
    move(board, index)
    display_board(board)
  end
board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
display_board(board)
turn(board)
