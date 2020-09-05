# typed: false
# spec/test_spec.rb

require 'sorbet-runtime'
require 'rspec/sorbet'
require 'coffee_cart'

describe CoffeeCart do
  describe '#receive_order' do
    it 'should receive instruction to make drink with sugar' do
      # GIVEN
      drink = 'T'
      sugar = 1
      money = 0.4

      # WHEN
      result = CoffeeCart.new.get_order(drink, sugar, money)

      # THEN
      expect(result).to eq('T:1:0')
    end

    it 'should receive instruction to make drinks with no sugar' do
      # GIVEN
      drink = 'H'
      sugar = 0
      money = 0.5

      # WHEN
      result = CoffeeCart.new.get_order(drink, sugar, money)

      # THEN
      expect(result).to eq('H::')
    end

    it 'should receive instruction to make drinks with two sugar and add a stick' do
      # GIVEN
      drink = 'C'
      sugar = 2
      money = 0.6

      # WHEN
      result = CoffeeCart.new.get_order(drink, sugar, money)

      # THEN
      expect(result).to eq('C:2:0')
    end

    it 'should only make drink if the correct amount of money is given' do
      # GIVEN
      drink = 'T'
      sugar = 1
      money = 0.4

      # WHEN
      result = CoffeeCart.new.get_order(drink, sugar, money)

      # THEN
      expect(result).to eq('T:1:0')
    end

    it 'should return message with how much money missing for the order' do
      # GIVEN
      drink = 'T'
      sugar = 1
      money = 0.3

      # WHEN
      result = CoffeeCart.new.get_order(drink, sugar, money)

      # THEN
      expect(result).to eq('M:Not enough')
    end
  end

  describe '#deliver_message' do
    it 'should receive a message with a drink order' do
      # GIVEN
      message = 'Hello'

      # WHEN
      result = CoffeeCart.new.send_message(message)

      # THEN
      expect(result).to eq('M:' + 'Hello')
    end
  end
end
