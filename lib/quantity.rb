require "numeric"

require "quantity/arithmetic"
require "mongoid/quantity"

class Quantity < Numeric
  include Quantity::Arithmetic

  INTEGER = 'I'
  FLOAT   = 'F'

  attr_reader :unit, :value

  def initialize(initial)
    case initial

    when Numeric
      @unit = initial.is_a?(Integer) ? INTEGER : FLOAT

    when Hash
      @unit = initial[:unit] || initial['unit']
      raise TypeError.new("unit must be '#{INTEGER}' or '#{FLOAT}'") unless @unit == INTEGER || @unit == FLOAT
      initial = initial[:value] || initial['value']
    end

    raise TypeError.new('initial value must be Numeric') unless initial.is_a?(Numeric)

    @value = case @unit
    when INTEGER
      Integer(initial)
    when FLOAT
      Float(initial)
    end
  end

  # @return BigDecimal
  def to_d
    value.to_d
  end

  # @return Float
  def to_f
    value.to_f
  end

  # @return Integer
  def to_i
    value.to_i
  end

  # @return String
  def to_s
    value.to_s
  end

  # @return String
  def inspect
    "#<#{self.class.name} value:#{value} unit:#{unit}>"
  end
end
