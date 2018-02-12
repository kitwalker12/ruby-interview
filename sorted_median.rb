# Find the median of two sorted arrays

def sorted_median(arrA, arrB)
  m, n = arrA.length, arrB.length
  arrA, arrB, m, n = arrB, arrA, n, m if m > n
  raise Exception if n == 0

  imin, imax, half_len = 0, m, (m + n + 1) / 2
  while imin <= imax
    i = (imin + imax) / 2
    j = half_len - i
    if i < m && arrB[j-1] > arrA[i]
      # i is too small, must increase it
      imin = i + 1
    elsif i > 0 && arrA[i-1] > arrB[j]
      # i is too big, must decrease it
      imax = i - 1
    else
      # i is perfect

      if i == 0
        max_of_left = arrB[j-1]
      elsif j == 0
        max_of_left = arrA[i-1]
      else
        max_of_left = [arrA[i-1], arrB[j-1]].max
      end

      if (m + n) % 2 == 1
        return max_of_left
      end

      if i == m
        min_of_right = arrB[j]
      elsif j == n
        min_of_right = arrA[i]
      else
        min_of_right = [arrA[i], arrB[j]].min
      end

      return (max_of_left + min_of_right) / 2.0
    end
  end
end

nums1 = [1, 2]
nums2 = [3, 4]
sorted_median(nums1,nums2)
