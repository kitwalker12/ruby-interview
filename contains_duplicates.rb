# Check if array contains duplicates

# @param {Integer[]} nums
# @return {Boolean}
def contains_duplicate(nums)
    set = Set.new([])
    nums.each do |i|
        if set.include?(i)
            return true
        else
            set << i
        end
    end
    return false
end

# Check if array contains duplicates in a window k
def containes_nearby_duplicates(nums, k)
  set = Set.new([])
  nums.each_with_index do |val, i|
    return true if set.include?(val)
    set << val
    set.delete(nums[i-k]) if set.length > k
  end
  return false
end
