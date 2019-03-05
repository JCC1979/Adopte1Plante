class Pot < Variant
  def self.taxref
    self.product.details["taxref"]
  end
end