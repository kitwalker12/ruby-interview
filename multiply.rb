# Multiple very large numbers using their string representation

def multiply(num1, num2)
  if num1.length < num2.length
    num1, num2 = num2, num1
  end

  prod = Array.new(num1.length+num2.length, 0)
  (num1.length - 1).downto(0) do |i|
    (num2.length - 1).downto(0) do |j|
      tmp = num1[i].to_i * num2[j].to_i
      low, high = i+j+1, i+j
      tmp += prod[low]
      prod[low] = tmp % 10
      prod[high] += tmp / 10
    end
  end

  res = prod.join('').gsub(/^0+/, '')
  return res.empty? ? "0" : res
end

multiply("123456","123")
multiply("123456","0")
multiply("12345643653420750387459832475893456938246573874569783246539824756938245632856938467593824765","11232347234982764823974629384762987346892374")
