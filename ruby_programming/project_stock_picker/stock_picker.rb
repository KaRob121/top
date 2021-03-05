# Things I learned:
# I had some trouble with this because I was obsessing
# over how to improve the time complexity. I knew that I could
# solve this in O(n^2) time by brute-forcing it and iterating 
# over the array for each element to find the largest difference.
# However, the solution I implemented below solves it in only O(n) 
# (or at least I think it does). 
#
# In terms of new things I learned, I learned about Ruby's representations
# of infinity, which are Float::INFINITY and -Float::INFINITY.

# Takes in an array of prices and returns an array containing [best day to buy, best day to sell]
def stock_picker(prices) 
    min_price = Float::INFINITY
    day_min_cost = 0
    max_price = -Float::INFINITY
    profit = -Float::INFINITY
    best_days = []

    prices.each_with_index do |price, day|
        if price < min_price 
            min_price = price
            day_min_cost = day
        end
        
        if price - min_price > profit && day > day_min_cost
            max_price = price
            profit = price - min_price
            best_days = [day_min_cost, day]
        end
    end

    if best_days.empty?
        # In the case that the prices are decreasing order and there are no duplicates, the best days 
        # to buy is the second to last day and the best day to sell is the last day
        best_days = [prices.length - 2, prices.length - 1]
    else
        best_days
    end
end

puts "The best days to buy and to sell are:"
# Sorted in increasing order
p stock_picker([1,3,6,6,8,9,10,15,17])
# Sorted in decreasing order (duplicates)
p stock_picker([17,15,10,9,8,6,6,3,1])
# Sorted in decreasing order (no duplicates)
p stock_picker([17,15,10,9,8,6,3,2,1])
# Example case provided by TOP
p stock_picker([17,3,6,9,15,8,6,1,10])