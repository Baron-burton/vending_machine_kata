class Inventory
  def initialize(products = [])
    @products = products
  end

  def list
    @products
  end
end
