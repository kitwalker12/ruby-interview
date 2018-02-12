#!/bin/ruby

# Add 1 to a string representation of an integer

def plus_one(arr)
  arr[-1] += 1
  (arr.length - 1).downto(0) do |i|
    break if arr[i] != 10
    arr[i] = 0
    arr[i-1] += 1
  end
  if arr[0] == 10
    arr[0] = 1
    arr.push(0)
  end
  arr
end
