class OutOfStockError < StandardError; end
class Inventory
  def initialize(products = [])
    @products = products
  end

  def list
    @products
  end

  def add(products)
    @products += products
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
    index = @products.index do |product|
      product.name == product_name
    end

    raise OutOfStockError.new('Sorry, we\'re out of stock.') if index.nil?

    index
  end
end
