# Given a 2-d array of words, check if a given word can be formed by traversing from an position in any 4 directions. Can be extended to include diagonal direction

board = [
  ['A','B','C','E'],
  ['S','F','C','S'],
  ['A','D','E','E']
]

$cols = board[0].length
$rows = board.length
$path = 0

$solMatrix = Array.new($rows){Array.new($cols)}
for i in (0...$rows) do
  for j in (0...$cols) do
    $solMatrix[i][j] = 0
  end
end

def search_word(board, word, row, col, i)
  return false if $solMatrix[row][col] != 0 || word[i] != board[row][col] #already visited this character in this path

  if i == word.length - 1 #found word
    $path += 1
    $solMatrix[row][col] = $path
    return true
  end

  $solMatrix[row][col] = $path
  $path += 1

  return true if ((row+1) < $rows && search_word(board, word, row+1, col, i+1)) #down

  return true if ((row-1) >= 0 && search_word(board, word, row-1, col, i+1)) #up

  return true if ((col-1) >= 0 && search_word(board, word, row, col-1, i+1)) #left

  return true if ((col+1) < $cols && search_word(board, word, row, col+1, i+1)) #right

  $solMatrix[row][col] = 0
  $path =- 1
  return false
end

# word = "ABCCED", -> returns true,
# word = "SEE", -> returns true,
# word = "ABCB", -> returns false.
# word = "ABCESCFSADEE", -> returns true.
# word = "SEE" -> returns true
done = false
for i in (0...$rows) do
  for j in (0...$cols) do
    if search_word(board, word, i, j, 0)
      done = true
      break
    end
  end
end

puts done
