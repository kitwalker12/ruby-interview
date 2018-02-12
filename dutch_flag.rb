#!/bin/ruby

# Parition an array based on the value at a given pivot index into values greater than and less than

def partition(pivot_index, arr)
  pivot = arr[pivot_index]
  smaller, equal, larger = 0, 0, arr.length
  while equal < larger
    if arr[equal] < pivot
      arr[smaller], arr[equal] = arr[equal], arr[smaller]
      smaller, equal = smaller+1, equal+1
    elsif arr[equal] == pivot
      equal += 1
    else
      larger -= 1
      arr[equal], arr[larger] = arr[larger], arr[equal]
    end
  end
end
