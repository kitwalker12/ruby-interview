# Given a stream of numbers delivered every second, create a class which can return the maximum seen in the last 24 hours and the average for the last 24 hours

class Logger
  attr_accessor :vals, :curr_size, :pos, :sum, :max_vals

  def initialize(size)
    @vals = Array.new(size, 0)
    @pos = 0
    @sum = 0
    @curr_size = 0
    @max_vals = []
  end

  def log(val)
    # Keep track of number of elements encountered so far
    if curr_size < size
      @curr_size += 1
    end

    # Keep track of total sum
    @sum -= vals[pos]
    @sum += val

    # Shift max_vals if current max is being replaced
    if curr_size == size
      @max_vals.shift if max_vals.first == vals[pos]
    end

    # Pop smaller elements from max_vals
    @max_vals.pop while !max_vals.empty? && max_vals.last < val
    @max_vals.push val

    # Insert new elements in window. Increase current window position
    @vals[pos] = val
    @pos = (@pos+1) % size

    return
  end

  def average
    return (sum.to_f/curr_size)
  end

  def max
    return max_vals.first
  end

  private

  def size
    vals.length
  end
end

a = Logger.new(5)
1.upto(10) do |i|
  num = rand()*100
  a.log(num.to_i)
  puts a.average
  puts a.max
end
