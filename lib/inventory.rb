class Inventory
  def initialize(products = [])
    @products = products
  end

  def list
    @products
  end

  def retrieve(product_name)
    index = @products.index do |product|
      product.name == product_name
    end

    @products.delete_at(index)
  end
end
