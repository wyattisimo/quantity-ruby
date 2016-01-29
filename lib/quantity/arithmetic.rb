class Quantity < Numeric
  module Arithmetic

    def -@
      self.class.new(unit: unit, value: -value)
    end

    def <=>(other)
      @value <=> coerce_other(other)
    end

    def +(other)
      @value + coerce_other(other)
    end

    def -(other)
      @value - coerce_other(other)
    end

    def *(other)
      @value * coerce_other(other)
    end

    def /(other)
      @value / coerce_other(other)
    end

    private def coerce_other(other)
      other = other.is_a?(Quantity) ? other.value : other
      raise TypeError.new("#{other.class} can't be coerced into a #{self.class}") unless other.is_a?(Numeric)
      return other
    end

  end
end
