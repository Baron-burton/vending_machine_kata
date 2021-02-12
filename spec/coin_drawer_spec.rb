require_relative '../lib/coin_drawer'

RSpec.describe CoinDrawer do
  it 'maintains a #balance' do
    coins = [ 1, 2, 5, 10, 20, 50, 100, 200 ]
    coin_drawer = CoinDrawer.new(coins)

    expect(coin_drawer.balance).to eq coins.sum
  end

  it 'allows more coins to be added' do
    initial_coins = [ 5, 10 ]
    coin_drawer = CoinDrawer.new(initial_coins)

    more_coins = [ 10, 50 ]
    coin_drawer.add(more_coins)
    expected_balance = (initial_coins + more_coins).sum

    expect(coin_drawer.balance).to eq expected_balance
  end
end
