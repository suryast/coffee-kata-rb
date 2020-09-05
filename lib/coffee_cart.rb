# typed: true
# define class CoffeeCart

# Implementation of CoffeeCart
class CoffeeCart
  extend T::Sig

  sig { params(drink: String, sugar: Integer).returns(String) }

  def receive_order(drink, sugar)
    stick = T.must(sugar).positive? ? 0 : ''
    sugar = sugar.zero? ? '' : sugar

    # return
    drink + ':' + sugar.to_s + ':' + stick.to_s
  end

  sig { params(_message: String).returns(String) }

  def deliver_message(_message)
    full_message = 'M:' + _message.to_s

    # return
    full_message
  end
end
