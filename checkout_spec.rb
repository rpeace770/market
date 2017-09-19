require_relative 'checkout'
require_relative 'item'

describe Checkout do
  let(:co) { Checkout.new }
  let(:apples) { Item.new({code: "AP1", name: "Apples", price: 6.00}) }
  let(:milk) { Item.new({code: "MK1", name: "Milk", price: 4.75}) }
  let(:chai) { Item.new({code: "CH1", name: "Chai", price: 3.11}) }
  let(:coffee) { Item.new({code: "CF1", name: "Coffee", price: 11.23}) }

  describe "total" do
    it "adds the total for all items in the basket" do
      co.scan(milk)
      co.scan(apples)
      expect(co.total).to eq 10.75
    end
  end

  describe "coupons" do
    it "discounts one coffee when buying two" do
      co.scan(coffee)
      co.scan(coffee)
      expect(co.total).to eq 11.23
    end

    it "discounts milk when also buying a chai" do
      co.scan(coffee)
      co.scan(apples)
      co.scan(chai)
      co.scan(milk)
      expect(co.total).to eq 20.34
    end

    it "discounts 1.50 each when buying three apple bags" do
      co.scan(apples)
      co.scan(apples)
      co.scan(chai)
      co.scan(apples)
      expect(co.total).to eq 16.61
    end
  end

end