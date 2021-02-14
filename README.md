# Vending Machine Kata

The challenge is as follows:

- Once an item is selected and the appropriate amount of money is inserted, the vending machine should return the correct product

- The machine should return change if too much money is provided

- The machine should ask for more money if insufficient funds have been inserted

- The machine should take an initial load of products and change

- The change will be of denominations: 1p, 2p, 5p, 10p, 20p, 50p, £1, £2

- There should be a way of reloading products at a later point

- There should be a way of reloading change at a later point

- The machine should keep track of the products and change that it contains

# How Can You Use It?

Feel free to clone this repository locally. To test it out yourself:

- open up an `irb` console in your terminal

- require the vending_machine and product files

- define an initial load of products by creating them as `Products`,
i.e. `Product.new(name: 'Coke', price: 50)

- define an initial load of coins using GBP denominations, i.e. `coins = [ '1p', '2p', '5p', '10p', '20p', '50p', '£1', '£2' ]`

- load those values into a new machine. `VendingMachine.new(products, coins)`. Be sure that the arguments are `Array`s

- Before a customer can order anything, they'll need to insert coins, `vending_machine.insert_coins(['50p'])`

- Then choose a product to order, `vending_machine.order('Coke')`

- The vending machine will return a `Product` and any change required


# Areas To Improve

1. The `CoinDrawer` class is used to represent the balance for both the user and the machine. Initially this was fine, however, with the addition of the `handle_payment` it meant that there was a method only useable in the context of a customer. This is also true of `return_change`, it's only in the context of a vending machine. This is probably a good indicator that two separate classes exist in here that could share the same base class.

2. Currently, there is no warning that the machine is out of coins. For a user expecting change, this would be an unwelcome surprise

3. The method `retrieve_coins_from_drawer` method is a little too hard to decipher with its use of `@coins.sort.reverse.map.with_index`. It helps ensure that we choose the largest denominations to return first so that the user is given an accurate refund, however, I don't think this is immediately apparent. There may be a more verbose methodology that I'm missing here.

# Final Words

This was my first pass on the challenge under a strict time constraint. I tried to favour simple solutions that aren't always elegant in an effort to meet the criteria of the challenge. Due to the strictness of time, there are some areas of technical debt, however, there are obvious ways to remove this debt and so I think it's a fair price to pay for now.
