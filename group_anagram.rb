# Given a list of words group them if they are anagrams of each other

def group_anagrams(anagrams)
  output = {}
  anagrams.each do |word|
    sorted = word.sort
    if output.key_exists?(sorted)
      if output[sorted].include?(word)
        next
      else
        output[sorted] << word
      end
    else
      output[sorted] = [word]
    end
  end

  puts output.values
end
