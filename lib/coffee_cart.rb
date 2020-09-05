# frozen_string_literal: true

# typed: strict
# define class CoffeeCart

# Implementation of CoffeeCart
class CoffeeCart
  extend T::Sig

  module PriceEnum
    TEA = 0.4
    COFFEE = 0.6
    CHOCOLATE = 0.5
  end

  sig { params(drink: String, sugar: Integer, money: Float).returns(String) }

  def get_order(drink, sugar, money)
    stick = sugar.positive? ? 0 : ''
    sugar = sugar.zero? ? '' : sugar

    # return
    correct_change?(drink, money) == true ? drink + ':' + sugar.to_s + ':' + stick.to_s : send_message('Not enough')
  end

  sig { params(_message: String).returns(String) }

  def send_message(_message)
    'M:' + _message.to_s
  end

  sig {params(drink: String, money: Float).returns(T::Boolean)}
  private
  def correct_change?(drink, money)
    send_missing_amount(drink, money).zero? ? true : false
  end

  sig { params(drink: String, money: Float).returns(Float) }
  private

  def send_missing_amount(drink, money)
    if drink == 'T' && money >= PriceEnum::TEA ||
       drink == 'C' && money >= PriceEnum::COFFEE ||
       drink == 'H' && money >= PriceEnum::CHOCOLATE
      0.to_f
    else
      money
    end
  end
end
