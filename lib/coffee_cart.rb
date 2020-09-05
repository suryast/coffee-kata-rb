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
    ORANGE_JUICE = 0.6
  end

  sig { params(drink: String, sugar: Integer, money: Float, extra_hot: T::Boolean).returns(String) }

  def get_order(drink, sugar, money, extra_hot = false)
    stick = sugar.positive? ? 0 : ''
    sugar = sugar.zero? ? '' : sugar

    extra_hot ? drink = (drink + 'h') : drink

    missing_money = send_missing_amount(drink, money)

    # return
    correct_change?(drink, money) ? (drink + ':' + sugar.to_s + ':' + stick.to_s) : send_message(missing_money.to_s)
  end

  sig { params(_message: String).returns(String) }

  def send_message(_message)
    'M:' + _message.to_s
  end

  sig { params(drink: String, money: Float).returns(T::Boolean) }

  def correct_change?(drink, money)
    T.must(send_missing_amount(drink, money)).zero? ? true : false
  end

  sig { params(drink: String, money: Float).returns(T.nilable(T.any(Integer, Float))) }

  def send_missing_amount(drink, money)
    if !(drink == 'T' && money >= PriceEnum::TEA ||
        drink == 'C' && money >= PriceEnum::COFFEE ||
        drink == 'H' && money >= PriceEnum::CHOCOLATE ||
        drink == 'O' && money >= PriceEnum::ORANGE_JUICE)
      missing_amount(drink, money)
    else
      0.0
    end
  end

  sig { params(drink: String, money: Float).returns(T.nilable(T.any(Integer, Float))) }

  def missing_amount(drink, money)
    if drink == 'T' || drink == 'Th'
      (PriceEnum::TEA - money).round(1)
    elsif drink == 'C' || drink == 'Ch'
      (PriceEnum::COFFEE - money).round(1)
    elsif drink == 'H' || drink = 'Hh'
      (PriceEnum::CHOCOLATE - money).round(1)
    else
      (PriceEnum::ORANGE_JUICE - money).round(1)
    end
  end

  private :correct_change?
  private :send_missing_amount
  private :missing_amount
end
