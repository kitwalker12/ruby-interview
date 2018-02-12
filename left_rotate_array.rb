#!/bin/ruby

# Rotate an array by a given number of digits

n,d = gets.strip.split(' ')
n = n.to_i
d = d.to_i
a = gets.strip
a = a.split(' ').map(&:to_i)

def gcd(a,b)
    if b==0
        return a
    else
        return gcd(b, a%b)
    end
end

for i in 0...gcd(n,d)
    tmp = a[i]
    j=i
    while true
        k = j+d
        if k>=n
            k = k-n
        end
        if k==i
            break
        end
        a[j] = a[k]
        j = k
    end
    a[j]=tmp
end
puts a.join(' ')
