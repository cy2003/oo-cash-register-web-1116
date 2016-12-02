class CashRegister

attr_accessor :total, :discount, :items_array, :last_transaction_price

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items_array = []
  end

  def add_item(item, price, units=1)
    units.times do
      @items_array << item
    end

    @last_transaction_price = price * units

    @total += price * units
  end

  def apply_discount
    if @discount == 0
      "There is no discount to apply."
    else
      @total = @total * ((100 - @discount) / 100.00)
      "After the discount, the total comes to $#{@total.round}."
    end
  end

  def items
    @items_array
  end

  def void_last_transaction
    @total -= @last_transaction_price
  end

end
