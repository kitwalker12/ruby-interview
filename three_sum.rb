# Find trio of elements in an array which total to 0

def three_sum(arr)
  for i in 0..(arr.length-3) do
    a = arr[i]
    s = i+1
    e = arr.length - 1
    while s < e
      b = arr[s]
      c = arr[e]
      if (a+b+c) == 0
        puts "#{a}, #{b}, #{c}"
        if b == arr[s+1]
          s += 1
        else
          e -= 1
        end
      elsif (a+b+c) > 0
        e -= 1
      else
        s += 1
      end
    end
  end
end

arr = [-25,-10,-7,-3,2,4,8,10]
three_sum(arr)

# For non zero sum subtract all the elements of arr by sum/3
