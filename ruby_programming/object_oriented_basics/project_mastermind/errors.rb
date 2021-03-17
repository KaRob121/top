# frozen_string_literal: true

# custom InvalidGuessError class
class InvalidGuessError < StandardError
  def initialize(msg = 'Oops! Please enter a 4-digit guess that contains only the numbers 1-6.')
    super(msg)
  end
end

# custom InvalidRoleError class
class InvalidRoleError < StandardError
  def initialize(msg = 'Invalid role. Please choose between being 1 (codebreaker) or the 2 (codemaker.')
    super(msg)
  end
end
