# Find pairs in an array which total a given sum k

def pair_sum(a,k)
  if a.length < 2
    return

  seen = Set.new
  output = Set.new

  a.each do |num|
    target = k - num
    if set.include?(target)
      seen << num
    else
      output << [[target, num].min, [target, num].max]
    end
  end

  return output
end
