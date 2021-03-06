require "bigdecimal"
require "numeric"
require "quantity/arithmetic"
require "mongoid/quantity"

class Quantity < Numeric
  include Quantity::Arithmetic

  INTEGER = 'I'
  FLOAT   = 'F'

  def initialize(initial)
    value = case initial
    when Quantity
      initial.value
    when Hash
      initial[:value] || initial['value']
    when String
      initial.to_i == initial.to_f ? initial.to_i : initial.to_f
    else
      initial
    end

    raise TypeError.new('initial value must be Numeric') unless value.is_a?(Numeric)

    @value = value.is_a?(Integer) ? value : BigDecimal(value.to_s)
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
