# Things I learned:
# This project was pretty simply since I already understood the 
# logic behing bubble sort. However, one thing
# I did learn was how to calculate and print out how long a Ruby program
# takes using the Process#clock_gettime, which I learned about on 
# https://blog.dnsimple.com/2018/03/elapsed-time-with-ruby-the-right-way/.

starting = Process.clock_gettime(Process::CLOCK_MONOTONIC)

# Takes in an array of numbers as input and returns the array sorted in increasing order.
def bubble_sort(array)
    swapped = true
    while swapped
        swapped = false
        array.each_with_index do |num, ind|
            if ind + 1 != array.length && num > array[ind + 1]
                swapped = true
                temp = num
                array[ind] = array[ind + 1]
                array[ind + 1] = temp 
            end
        end
    end
    array
end

puts "The original array is:"
p [4,3,78,2,0,2]
puts "The sorted array is:"
p bubble_sort([4,3,78,2,0,2]) 

ending = Process.clock_gettime(Process::CLOCK_MONOTONIC)
puts "\nRunning time:"
puts (ending - starting).to_s + "secs"