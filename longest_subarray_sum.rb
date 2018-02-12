# Find the length of longest sub-array which totals a given sum k

def longest_subarray_sum(arr, k)
  sum = 0
  count = 0
  max_count = 0

  for i in 0...arr.length do
    if (sum + arr[i]) <= k
      sum += arr[i]
      count += 1
    elsif sum != 0
      sum = sum - arr[i - count] + arr[i]
    end

    max_count = [count, max_count].max
  end

  max_count
end

arr = [1, 2, 1, 0, 1, 1, 0]
longest_subarray_sum(arr, 4)
