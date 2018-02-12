# Design a stack that supports push, pop, top, and retrieving the minimum element in constant time.

class MinStack
  attr_accessor :vals, :min

  def initialize
    @vals = []
    @min = []
  end

  def push(x)
    if min.empty? || x <= self.get_min()
      min.push(x)
    end
    vals.push(x)
  end

  def pop
    if vals.last == self.get_min()
      min.pop
    end
    vals.pop
  end

  def get_min
    min.last
  end
end

min_stack = MinStack.new
90.upto(100) do |i|
  min_stack.push(i)
end
min_stack.pop
min_stack.get_min

