require_relative '../lib/inventory'
require_relative '../lib/product'

RSpec.describe Inventory do
  it 'stores a #list of products' do
    products = [
      Product.new(name: 'Coke', price: 50),
      Product.new(name: 'Doritos', price: 100)
    ]

    inventory = Inventory.new(products)

    expect(inventory.list).to eq products
  end
end
