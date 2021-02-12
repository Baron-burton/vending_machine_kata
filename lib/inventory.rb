class Inventory
  def initialize(products = nil)
    @products = products
  end

  def list
    @products
  end
end
