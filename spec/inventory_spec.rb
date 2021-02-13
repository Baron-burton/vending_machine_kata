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

  it 'allows you to retrieve an item from the inventory' do
    coke_product = Product.new(name: 'Coke', price: 50)
    dorito_product = Product.new(name: 'Doritos', price: 100)

    inventory = Inventory.new([coke_product, dorito_product])

    expect(inventory.retrieve('Coke')).to eq coke_product
    expect(inventory.list).to eq [dorito_product]
  end
end
