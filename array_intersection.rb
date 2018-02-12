# Find Intersection of 2 arrays

def intersection(a,b)
  map = {}
  a.each do |i|
    map[i] ||= 0
    map[i] += 1
  end

  res = []

  b.each do |i|
    if map.key?(i)
      map[i] -= 1
      res << i if map[i] == 0
    end
  end

  return res
end
