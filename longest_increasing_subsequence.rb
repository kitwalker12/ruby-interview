# Find the longest increasing sub-sequence in an array

def lis(arr)
  lis = Array.new(arr.length, 1)

  for i in 1...arr.length do
    for j in 0...i do
      lis[i] = lis[j]+1 if arr[i] > arr[j] && lis[i]< lis[j] + 1
    end
  end

  lis.max
end

arr = [50, 3, 10, 7, 40, 80]
lis(arr)
