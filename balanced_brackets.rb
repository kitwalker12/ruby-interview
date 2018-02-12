#!/bin/ruby

# Check if a string containing brackets is balanced

t = gets.strip.to_i
for a0 in (0..t-1)
  expression = gets.strip
  stack = []
  unbalanced = false
  expression.split('').each do |bracket|
    if ['{','[','('].include?bracket
      stack.push bracket
    else
      if ['}',']',')'].include?bracket
        if ['{}','[]','()'].include?("#{stack.pop}#{bracket}")
          next
        else
          unbalanced = true
          break
        end
      end
    end
  end
  stack.length == 0 && !unbalanced ? puts("YES") : puts("NO")
end
