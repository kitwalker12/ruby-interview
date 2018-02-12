# Given an expression tree:
#    +
#   * /
# 3 4 8 4
# Make a data-structure which will be traversed to calculate the expression
# Here we used an array with structure similar to a heap

arr = [0,"+","*","/",3,4,8,4]

def traverse(arr,i)
  if i < arr.length
    curr = arr[i]
    if curr.is_a?(Integer)
      return curr
    else
      return traverse(arr,2*i).send(curr,traverse(arr,(2*i)+1))
    end
  end
end

res = traverse(arr,1)
puts res
