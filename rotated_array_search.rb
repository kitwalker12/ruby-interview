# Find an element in a sorted array which has been rotated using binary search.

def binary_search(arr, low, high, key)
  return -1 if high < low

  mid = (low+high)/2

  return mid if key == arr[mid]

  if key > mid
    return binary_search(arr, (mid+1), high, key)
  else
    return binary_search(arr, low, (mid-1), key)
  end
end

def find_rot_index(arr, low, high)
  return -1 if high < low

  return low if high == low

  mid = (low+high)/2

  return mid if mid < high && arr[mid] > arr[mid+1]

  return (mid-1) if mid > low && arr[mid] < arr[mid-1]

  if arr[low] >= arr[mid]
    return find_rot_index(arr, low, mid-1)
  else
    return find_rot_index(arr, mid+1, high)
  end
end

def rot_binary_search(arr, key)
  n = arr.length

  rot_index = find_rot_index(arr, 0, n-1)

  return binary_search(arr, 0, n-1, key) if rot_index == -1

  return rot_index if arr[rot_index] == key

  if arr[0] <= key
    return binary_search(arr, 0, rot_index-1, key)
  else
    return binary_search(arr, rot_index+1, n-1, key)
  end
end


# Improved
def rot_binary_search_v2(arr, low, high, key)
  return -1 if low > high

  mid = (low+high)/2

  return mid if key == arr[mid]

  if arr[low] <= arr[mid] #low to mid is sorted
    if key >= arr[low] && key <= arr[mid]
      rot_binary_search_v2(arr, low, mid-1, key) #recursion in low to mid
    end

    return rot_binary_search_v2(arr, mid+1, high, key) #recursion in mid high
  end

  #mid to high must be sorted
  if key >= arr[mid] && key <= arr[high]
    return rot_binary_search_v2(arr, mid+1, high, key) #recursion in mid high
  end

  return rot_binary_search_v2(arr, low, mid-1, key) #recursion in low to mid
end
