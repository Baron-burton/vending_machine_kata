require_relative '../lib/coin_drawer'

RSpec.describe CoinDrawer do
  it 'maintains a #balance' do
    coins = [1, 2, 5, 10, 20, 50, 100, 200]
    coin_drawer = CoinDrawer.new(coins)

    expect(coin_drawer.balance).to eq coins.sum
  end
end
