# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0,1,2], #top_row
  [3,4,5], #middle row
  [6,7,8], #bottom_row
  [0,3,6], #first_col
  [1,4,7], #second_col
  [2,5,8], #third_col
  [0,4,8], #diagon
  [6,4,2] #diagon
]

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] && 
    board[combo[1]] == board[combo[2]] &&
    position_taken?(board, combo[0])
  end
end

def full?(board)
  board.all? {|token| token == "X" || token == "O"}
end

def draw?(board)
  full?(board) && !won?(board)
end 

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  if winning = won?(board)
    board[winning.first]
  end
end

