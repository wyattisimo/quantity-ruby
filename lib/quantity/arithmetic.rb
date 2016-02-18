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
      Quantity.new(other)
    end

  end
end
