def stock_picker(stock_array)
  price_hash = Hash.new
  for i in 0..stock_array.length - 1
    for j in i + 1..stock_array.length - 1 
      next if stock_array[i] >= stock_array[j]
      price_hash[stock_array[j] - stock_array[i]] = [i, j]
    end
  end
  best_buy = price_hash.max_by {|k, v| k}
  puts "Best buy/sell days: #{best_buy[1]} for $#{best_buy[0]} of profit"
end

stock_picker([17,3,6,9,15,8,6,1,10])