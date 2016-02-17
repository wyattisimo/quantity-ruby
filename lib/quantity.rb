require "bigdecimal"
require "numeric"
require "quantity/arithmetic"
require "mongoid/quantity"

class Quantity < Numeric
  include Quantity::Arithmetic

  INTEGER = 'I'
  FLOAT   = 'F'

  def initialize(initial)
    if initial.is_a?(Hash)
      initial = initial[:value] || initial['value']
    end
    if initial.is_a?(String)
      initial = initial.to_i == initial.to_f ? initial.to_i : initial.to_f
    end

    raise TypeError.new('initial value must be Numeric') unless initial.is_a?(Numeric)

    @value = initial.is_a?(Integer) ? initial : BigDecimal(initial.to_s)
  end

  # The value.
  #
  # @return [Integer or Float]
  def value
    @value.is_a?(Integer) ? @value : @value.to_f
  end

  # The unit type.
  #
  # @return [String]
  def unit
    @value.is_a?(Integer) ? INTEGER : FLOAT
  end

  # @return [BigDecimal]
  def to_d
    BigDecimal(value.to_s)
  end

  # @return [Float]
  def to_f
    value.to_f
  end

  # @return [Integer]
  def to_i
    value.to_i
  end

  # @return [String]
  def to_s
    value.to_s
  end

  # @return [String]
  def inspect
    "#<#{self.class.name} value:#{value} unit:#{unit}>"
  end
end
