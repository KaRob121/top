require 'pry'

# Returns true if the provided ascii value converts to a lowercase letter
def is_lowercase_letter?(ascii) 
    ascii >= 97 && ascii <= 122
end

# Returns true if the provided ascii value converts to a uppercase letter
def is_uppercase_letter?(ascii)
    ascii >= 65 && ascii <= 90
end

# Returns an encrypted string whose characters have been shifted by the shift factor
def caesar_cipher(string, shift_factor)
    # Converts the characters of the string to their ascii values 
    orig_ascii = string.bytes
    enc_ascii = orig_ascii.map do |ascii|
        if is_lowercase_letter?(ascii) 
            first_letter_ascii = 97
            ascii = first_letter_ascii + ((ascii - first_letter_ascii + shift_factor) % 26)
        elsif is_uppercase_letter?(ascii)
            first_letter_ascii = 65
            ascii = first_letter_ascii + ((ascii - first_letter_ascii + shift_factor) % 26)
        else
            ascii
        end
    end
    # Converts the ascii values back to characters and packs them into a string
    enc_ascii.pack('c*')
end

puts "Enter a string into the Caesar Cipher:"
string = gets.chomp

puts "Enter a shift factor:" 
shift_factor = gets.chomp.to_i

puts "The encrypted string is:"
puts caesar_cipher(string, shift_factor)