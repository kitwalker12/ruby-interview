# Move zeroes in an array to the front

def move_zeroes(arr)
  last = 0
  for i in (0...arr.length) do
    if arr[i] != 0
      arr[i], arr[last] = arr[last], arr[i]
      last += 1
    end
  end
  return arr
end
