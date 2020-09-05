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

      # WHEN
      result = CoffeeCart.new.receive_order(drink, sugar)
      puts result

      # THEN
      expect(result).to eq('T:1:0')
    end

    it 'should receive instruction to make drinks with no sugar' do
      # GIVEN
      drink = 'H'
      sugar = 0

      # WHEN
      result = CoffeeCart.new.receive_order(drink, sugar)
      puts result

      # THEN
      expect(result).to eq('H::')
    end

    it 'should receive instruction to make drinks with two sugar and add a stick' do
      # GIVEN
      drink = 'C'
      sugar = 2

      # WHEN
      result = CoffeeCart.new.receive_order(drink, sugar)
      puts result

      # THEN
      expect(result).to eq('C:2:0')
    end
  end

  describe '#deliver_message' do
    it 'should receive a message with a drink order' do
      # GIVEN

      # WHEN
      result = CoffeeCart.new.deliver_message('Hello')

      # THEN
      expect(result).to eq('M:' + 'Hello')
    end
  end
end
