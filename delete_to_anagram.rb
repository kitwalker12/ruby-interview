#!/bin/ruby

# Fing how many operations are needed to convert a string into another

a = gets.strip
b = gets.strip
chars = {}
count = 0

a.split('').each do |c|
    chars[c]||=0
    chars[c]+=1
end

b.split('').each do |c|
    if chars.key?(c)
        if chars[c] != 0
            chars[c] -= 1
        else
            count+=1
        end
    else
        count+=1
    end
end

chars.values.each do |v|
    count += v
end

puts count.to_s
