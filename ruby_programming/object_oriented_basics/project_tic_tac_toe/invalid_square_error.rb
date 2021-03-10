# frozen_string_literal: true

# custom InvalidSquareError class
class InvalidSquareError < StandardError
  def initialize(msg = 'You cannot place your piece in this square!')
    super(msg)
  end
end
