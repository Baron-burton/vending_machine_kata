require_relative '../lib/product'

RSpec.describe Product do
  it 'has a :name and a :price' do
    product = Product.new(name: 'Coke', price: 50)

    expect(product.name).to eq 'Coke'
    expect(product.price).to eq 50
  end
end
