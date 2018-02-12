# Rotate a 2-d matrix clockwise.

def rotate_matrix(matrix)
  0.upto((matrix.length/2 - 1)) do |layer|
    first = layer
    last = matrix.length - 1 - layer

    first.upto(last-1) do |i|
      offset = i - first

      top = matrix[first][i]
      matrix[first][i] = matrix[last-offset][i]
      matrix[last-offset][first] = matrix[last][last-offset]
      matrix[last][last-offset] = matrix[i][last]
      matrix[i][last] = top
    end
  end
end

matrix = [[1,2,3],[4,5,6],[7,8,9]]
rotate_matrix(matrix)

