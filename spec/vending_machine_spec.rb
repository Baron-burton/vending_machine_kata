require_relative '../lib/vending_machine'
require_relative '../lib/inventory'
require_relative '../lib/product'

RSpec.describe VendingMachine do
  it 'can take an initial load of products for its inventory' do
    products = [ Product.new(name: 'Coke', price: 50) ]

    expect(Inventory).to receive(:new).with(products)

    VendingMachine.new(products)
  end
end
