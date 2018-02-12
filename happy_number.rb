# Write an algorithm to determine if a number is "happy".

# A happy number is a number defined by the following process: Starting with any positive integer, replace the number by the sum of the squares of its digits, and repeat the process until the number equals 1 (where it will stay), or it loops endlessly in a cycle which does not include 1. Those numbers for which this process ends in 1 are happy numbers.

def sq_sum(n)
  sum = 0
  while n > 0
    tmp = n % 10
    sum += tmp * tmp
    n /= 10
  end
  sum
end

def is_happy?(n)
  slow, fast = n, n
  loop do
    slow = sq_sum(slow)
    fast = sq_sum(fast)
    fast = sq_sum(fast)
    break if slow == fast
  end

  return slow == 1
end
