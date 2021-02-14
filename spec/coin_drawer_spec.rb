require_relative '../lib/coin_drawer'

RSpec.describe CoinDrawer do
  it 'maintains a #balance' do
    inserted_coins = [ '1p', '2p', '5p', '10p', '20p', '50p', '£1', '£2' ]
    inserted_coins_as_pence = [ 1, 2, 5, 10, 20, 50, 100, 200 ]

    coin_drawer = CoinDrawer.new(inserted_coins)

    expect(coin_drawer.balance).to eq inserted_coins_as_pence.sum
  end

  it 'allows more coins to be added' do
    initial_coins = [ '5p', '10p' ]
    initial_coins_as_pence = [ 5, 10 ]

    coin_drawer = CoinDrawer.new(initial_coins)

    more_coins = [ '10p', '50p' ]
    more_coins_as_pence = [ 10, 50 ]

    coin_drawer.add(more_coins)
    expected_balance = (initial_coins_as_pence + more_coins_as_pence).sum

    expect(coin_drawer.balance).to eq expected_balance
  end

  it 'adjust the balance when taking payment' do
    inserted_coins = [ '5p', '10p' ]
    inserted_coins_as_pence = [ 5, 10 ]
    price_of_product = 10

    coin_drawer = CoinDrawer.new(inserted_coins)

    expect(coin_drawer.handle_payment(price_of_product)).to eq(5)
  end

  it 'returns change if too much money is provided' do
    initial_coin_load  = [ '1p', '1p', '1p', '2p', '10p' ]
    coin_drawer = CoinDrawer.new(initial_coin_load)

    expect(coin_drawer.return_change(5)).to eq(['2p', '1p', '1p', '1p'])
  end
end
