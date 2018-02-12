#!/bin/ruby

# Find maximum profit that can be obtained by selling and buying a stock, given an array of stock prices

def max_profit(prices)
  min_so_far, max_profit = Float::INFINITY, 0
  for price in prices do
    profit = price - min_so_far
    max_profit = [max_profit, profit].max
    min_so_far = [min_so_far, price].min
  end
  max_profit
end
