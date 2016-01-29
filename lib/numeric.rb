class Numeric
  def to_qty
    Quantity.new(itself)
  end
end
