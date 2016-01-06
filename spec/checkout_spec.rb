require 'checkout'

RSpec.describe(Checkout) do

  let(:items)          { }
  let(:total_discount) { false }
  let(:multibuy)       { false }

  subject { Checkout.new(total_discount: total_discount, multibuy: multibuy) }

  context 'testing the total' do
    let(:items) { %w(001 002) }

    it 'calculates the total' do
      items.each do |item|
        subject.scan(item)
      end

      expect(subject.total).to eq(54.25)
    end
  end
  
  it 'applies a discount if the basket total is more than £60' do

  end

  it 'reduces the price of item 001 if more than one is bought' do

  end
end