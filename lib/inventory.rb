class Inventory
  def initialize(products = [])
    @products = products
  end

  def list
    @products
  end

  def retrieve(product_name)
    index = product_index(product_name)

    @products.delete_at(index)
  end

  def product_details(product_name)
    index = product_index(product_name)

    @products[index]
  end

  private

  def product_index(product_name)
    @products.index do |product|
      product.name == product_name
    end
  end
end
