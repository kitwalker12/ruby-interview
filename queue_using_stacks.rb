#!/bin/ruby

# Create queue using 2 stacks

n = gets.strip.to_i
instack = []
outstack = []
for i in (0...n)
  q,x = gets.strip.split(' ')
  case q.to_i
  when 1
    instack.push(x)
  when 2,3
    if outstack.length == 0
      while instack.length > 0
        outstack.push(instack.pop())
      end
    end
    q.to_i == 2 ? outstack.pop() : puts(outstack.last)
  end
end
