# frozen_string_literal: true

# custom InvalidGuessLengthError class
class InvalidGuessLengthError < StandardError
  def initialize(msg = 'Oops! Please enter a 4-digit guess.')
    super(msg)
  end
end

# custom InvalidGuessContentError class
class InvalidGuessContentError < StandardError
  def initialize(msg = 'Oops! Please make sure your guess only contains the digits 1, 2, 3, 4, 5, or 6.')
    super(msg)
  end
end
