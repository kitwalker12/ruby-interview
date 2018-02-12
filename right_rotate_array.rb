# Rotate an array to the right by a given value k

def reverse(nums, start, last)
  while(start < last)
    temp = nums[start]
    nums[start] = nums[last]
    nums[last] = temp
    start += 1
    last -= 1
  end
end

def rotate(nums, k)
  k %= nums.length
  n = nums.length
  reverse(nums, 0, n-1)
  reverse(nums, 0, k-1)
  reverse(nums, k, n-1)
end
