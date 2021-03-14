# frozen_string_literal: true

# custom InvalidGuessError class
class InvalidGuessError < StandardError
  def initialize(msg = 'Oops! Please enter a 4-digit guess that contains only the numbers 1-6.')
    super(msg)
  end
end
