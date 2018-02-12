# Find the longest common prefix in an array of strings

def lcp(strs)
  if strs.blank? || strs.length == 0
    return ""
  end

  min = Float::INFINITY
  strs.each do |str|
    min = [min, str.length].min
  end

  low = 1
  high = min

  while low <= high
    mid = (low+high)/2
    if is_common(strs, mid)
      low = mid + 1
    else
      high = mid - 1
    end
  end

  return strs[0].first((low+high)/2)
end

def is_common(strs, len)
  prefix = strs[0].first(len)
  strs.each do |str|
    return false unless str.starts_with?(prefix)
  end
  return true
 end
