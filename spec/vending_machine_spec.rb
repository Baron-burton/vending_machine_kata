require_relative '../lib/vending_machine'
require_relative '../lib/inventory'
require_relative '../lib/product'

RSpec.describe VendingMachine do
  it 'can take an initial load of products for its inventory' do
    products = [ Product.new(name: 'Coke', price: 50) ]

    expect(Inventory).to receive(:new).with(products)

    VendingMachine.new(products)
  end

  it 'can take an initial load of coins' do
    coins = [ 1, 2, 5, 10, 20, 50, 100, 200 ]

    expect(CoinDrawer).to receive(:new).with(coins)

    VendingMachine.new(nil, coins)
  end

  it 'allows you to insert coins to increase your balance' do
    coins = [ 50, 50 ]
    vending_machine = VendingMachine.new

    vending_machine.insert_coins(coins)

    expect(vending_machine.balance).to eq(coins.sum)
  end
end
