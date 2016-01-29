class Quantity < Numeric

  # Converts an object of this instance into a database friendly value.
  def mongoize
    h = {
      unit:  unit,
      value: value,
    }
    h[:string] = value.to_s if unit == FLOAT
    return h
  end

  class << self

    # Convert the object from its Mongo-friendly type to an instance of this class.
    def demongoize(object)
      object[:value] = object.delete(:string).to_f if object.unit == FLOAT
      self.new(object)
    end

    # Converts the given object into the Mongo-friendly value for this class.
    def mongoize(object)
      case object
      when Quantity
        object.mongoize
      when Numeric
        Quantity.new(object).mongoize
      else
        object
      end
    end

  end

end
