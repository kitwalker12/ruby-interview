# Bubble Sort in Ruby

def bubble_sort(arr)
  swaps = 0
  (0...arr.length).to_a.each do |i|
    (0...(arr.length-1)).to_a.each do |j|
      if arr[j] > arr[j+1]
        arr[j],arr[j+1] = arr[j+1],arr[j]
        swaps += 1
      end
    end
  end

  puts "Array is sorted in #{swaps} swaps."
  puts "First Element: #{arr.first}"
  puts "Last Element: #{arr.last}"
end
