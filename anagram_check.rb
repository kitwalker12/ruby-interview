#Check if strings are anagrams

def anagram(s1,s2)
  s1 = s1.gsub(' ', '').downcase
  s2 = s2.gsub(' ', '').downcase

  return false if s1.length != s2.length

  count = {}

  s1.split('').each do |letter|
    count[letter] ||= 0
    count[letter] += 1
  end

  s2.split('').each do |letter|
    count[letter] ||= 0
    count[letter] -= 1
  end

  count.values.each do |k|
    return false if k != 0
  end

  return true
end
