# Build a vending machine:
#
# A user can insert cash and select an item
# The item will dispense an item if available
# Change will be given back in the highest denominations

# accept cash
# user selects item

# check inventory
  # if item is in stock
  # check cost
  #  if it is not in stock
  # display message 'please select another item'
  # end

# Check cost
  # check if cash >= price
    # despense item
  #  if price is not >= cash
    #  display message ask for another selection or insert more cash
  # end

# Despese item
# return remainder
# by highest denominations


# if cash is not >= any price
# return cash
# Any other inputs to consider
# Selecting an item buttons 1a 1b 1c 2a 2b 2c

# Vending machine class
# inventory
# total_cash
inventory = {
  a1: { name: 'candy_bar', price: 1.50, count: 2 },
  a2: { name: 'candy', price: 1.50, count: 0 },
  a3: { name: 'gum', price: 2.00, count: 1
  }
}

class VendingMachine
  attr_reader :inventory, :total_cash

  def initialize(inventory, total_cash = 0)
    @inventory = inventory
    @total_cash = total_cash
    @cash_back = Hash.new(0)
  end

  def add_cash(cash)
    @total_cash += cash
  end

  def select_item(button)
    @inventory[button]
  end

  def check_inventory(button)
    if @inventory[button][:count] > 0
      check_price(button)
    else
      return 'Item not in stock'
    end
  end

  def check_price(button)
    if @inventory[button][:price] >= @total_cash
      despense_item(button)
    else
      return 'More cash needed'
    end
  end

  def despense_item(button)
    @inventory[button][count] -= 1
    @total_cash -= @inventory[button][price]
    return @inventory[button][name]
  end

  def despense_change
    money = [
      { dollar: 100 },
      { quarter: 25 },
      { dime: 10 },
      { nickel: 5 },
      { penny: 1 }
    ]

    change = @total_cash

    money.each do |denomination, value|
      until change < value do
        @cash_back[denomination] += 1
        cash - value
      end
    end
  end
end
