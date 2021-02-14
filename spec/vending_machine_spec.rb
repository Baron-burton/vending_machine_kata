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
    coins = [ '1p', '2p', '5p', '10p', '20p', '50p', '£1', '£2' ]

    expect(CoinDrawer).to receive(:new).with(coins)

    VendingMachine.new(nil, coins)
  end

  it 'allows you to insert coins to increase your balance' do
    coins = [ '50p', '50p' ]
    vending_machine = VendingMachine.new

    vending_machine.insert_coins(coins)

    expect(vending_machine.customer_balance).to eq(100)
  end

  it 'inserting coins should also increase the vending machine\'s balance' do
    coins = [ '50p', '50p' ]
    vending_machine = VendingMachine.new

    vending_machine.insert_coins(coins)

    expect(vending_machine.balance).to eq(100)
  end

  it 'accepts an order for a product' do
    coke_product = Product.new(name: 'Coke', price: 50)

    vending_machine = VendingMachine.new([coke_product])
    vending_machine.insert_coins([ '50p' ])

    expect(vending_machine.order('Coke')).to contain_exactly(coke_product, nil)
  end

  it 'requires you to insert enough coins for the product' do
    coke_product = Product.new(name: 'Coke', price: 50)

    vending_machine = VendingMachine.new([coke_product])

    expect { vending_machine.order('Coke') }.to raise_error(
      InsufficientFunds, 'Please insert more coins'
    )
  end

  it 'can return change with the product' do
    coins = [ '1p', '2p', '5p', '10p', '20p', '50p', '£1', '£2' ]
    coke_product = Product.new(name: 'Coke', price: 50)

    vending_machine = VendingMachine.new([coke_product], coins)
    vending_machine.insert_coins([ '£1' ])

    expect(vending_machine.order('Coke')).to contain_exactly(coke_product, [ '50p' ])
  end

  it 'allows you to view the machine\'s coin balance' do
    vending_machine = VendingMachine.new(nil, [ '50p' ])

    expect(vending_machine.balance).to eq(50)
  end

  it 'allows you to reload coins into the machine' do
    vending_machine = VendingMachine.new()

    expect(vending_machine.balance).to eq(0)

    vending_machine.load_coins([ '50p' ])

    expect(vending_machine.balance).to eq(50)
  end

  it 'allows you to reload products into the machine' do
    vending_machine = VendingMachine.new()

    expect(vending_machine.list_products).to eq([])

    coke = Product.new(name: 'Coke', price: 50)
    vending_machine.load_products([coke])

    expect(vending_machine.list_products).to eq([coke])
  end
end
