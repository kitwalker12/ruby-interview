#!/bin/ruby

# Given a list of magazine words, check if a ransom note can be created using the words in the magazine. Each word in the magazine can only be used only once.

m,n = gets.strip.split(' ')
m = m.to_i
n = n.to_i
magazine = gets.strip
magazine = magazine.split(' ')
ransom = gets.strip
ransom = ransom.split(' ')
words = {}
magazine.each do |word|
    words[word]||=0
    words[word]+=1
end
result = true
ransom.each do |word|
    if words.key?word
        if words[word] > 1
            words[word]-=1
        else
            words.delete(word)
        end
    else
        result = false
        break
    end
end
result ? puts("Yes") : puts("No")
