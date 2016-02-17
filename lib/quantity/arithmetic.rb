class Quantity < Numeric
  module Arithmetic

    def -@
      self.class.new(unit: unit, value: -value)
    end

    def <=>(other)
      value <=> coerce_other(other)
    end

    def +(other)
      self.class.new(@value + coerce_other(other))
    end

    def -(other)
      self.class.new(@value - coerce_other(other))
    end

    def *(other)
      self.class.new(@value * coerce_other(other))
    end

    def /(other)
      self.class.new(@value / coerce_other(other))
    end

    def **(other)
      self.class.new(@value ** coerce_other(other))
    end

    private def coerce_other(other)
      value = case other
      when Quantity
        other.value
      when Hash
        other[:value] || other['value']
      else
        other
      end
      raise TypeError.new("#{value.class} can't be coerced into a #{self.class}") unless value.is_a?(Numeric)
      return value
    end

  end
end
