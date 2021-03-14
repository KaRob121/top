# frozen_string_literal: true

require_relative 'game'

# Computer class
class Computer < Game
  def self.make_code
    puts 'Making code...'
    sleep(0.5)
    code = ''
    4.times do
      code += [1, 2, 3, 4, 5, 6].sample.to_s
    end
    puts 'The code has been made.'
    code
  end
end
