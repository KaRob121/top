# Things I learned:
# I originally used String#include? and Hash#has_key?
# to implement my solution, but these methods did not account 
# for duplicates of the substring. I came upon the String#scan method
# while looking at the solutions of other people (specifically
# rlmoser and Angel Mitev) on the The Odin Project site for ideas.

# Takes in a string and a dictionary, returning a hash containing 
# the number of occurences of a substring in the passed string if that 
# substring is a word in the dictionary.
def substrings(string, dictionary)
    substrings = {}
    string = string.downcase
    dictionary.each do |word| 
        num_occurences = string.scan(word).length
        substrings[word] = num_occurences unless num_occurences == 0 
    end
    substrings
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
p substrings("below", dictionary)
p substrings("Howdy partner, sit down! How's it going?", dictionary)
