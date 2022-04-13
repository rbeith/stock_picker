def stock_picker(array)
possible_profit = Hash.new
  array.each_with_index do |sell_price, sell_day|
    array.reduce do |profit, buy_price|
      if sell_day > array.index(buy_price)
        profit = sell_price - buy_price
        possible_profit[profit] = [array.index(buy_price), sell_day]
      end
    end
  end
max_profit = possible_profit.keys.reduce {|max_profit, profit| max_profit > profit ? max_profit : profit }
possible_profit[max_profit]
end

p stock_picker([17,3,6,9,15,8,6,1,10])
#  => [1,4] for a profit of ($15 - $3 == $12)

# take array of prices, one for each day
#  start with array[0] and subtract each subsequent price from array[0]
#    store profit in new hash (key equal profit, value = [index a, index b] with index of price
#  repeat for each subsequent price array[1..n]
#  compare all profit values to find max profit
#   sort hash by largest value? 
# return pair of days e.g. [1, 4] which are the index of the days
#   from buy and sell