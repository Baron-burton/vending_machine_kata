require 'byebug'
class CoinDrawer
  DENOMINATIONS_TO_PENCE = {
    '1p' => 1,
    '2p' => 2,
    '5p' => 5,
    '10p' => 10,
    '20p' => 20,
    '50p' => 50,
    '£1' => 100,
    '£2' => 200,
  }.freeze

  PENCE_TO_DENOMINATION = {
    1 => '1p',
    2 => '2p',
    5 => '5p',
    10 => '10p',
    20 => '20p',
    50 => '50p',
    100 => '£1',
    200 => '£2',
  }.freeze

  def initialize(coins = [])
    converted_coins = convert_to_pence(coins)

    @coins = converted_coins
    @balance = converted_coins.inject(0, :+)
  end

  def add(coins)
    converted_coins = convert_to_pence(coins)

    @coins += converted_coins
    @balance += converted_coins.sum
  end

  def balance
    @balance
  end

  def handle_payment(price_to_pay)
    @balance -= price_to_pay
  end

  def return_change(amount_owing)
    if @coins.include?(amount_owing)
      coin = [@coins.delete(amount_owing)]

      convert_back_to_denomination(coin)
    else
      coins = retrieve_coins_from_drawer(amount_owing)

      convert_back_to_denomination(coins)
    end
  end

  private

  def retrieve_coins_from_drawer(amount_owing)
    @coins.sort.reverse.map.with_index do |coin, index|
      if (amount_owing - coin) >= 0
        amount_owing -= coin

        @coins.sort.reverse.delete_at(index)
      end
    end.compact
  end

  def convert_to_pence(coins)
    coins.map do |coin|
      DENOMINATIONS_TO_PENCE[coin]
    end.compact
  end

  def convert_back_to_denomination(coins)
    coins.map do |coin|
      PENCE_TO_DENOMINATION[coin]
    end.compact
  end
end
