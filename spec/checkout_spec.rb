require 'checkout'

RSpec.describe(Checkout) do

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

  context 'applies multibuy discount' do
    let(:multibuy) { true }
    let(:items)    { %w(001 003 001) }

    it 'reduces the price of item 001 if more than one is bought' do
      items.each do |item|
        subject.scan(item)
      end

      expect(subject.total).to eq(36.95)
    end

    it 'does not reduce the price of item 001 one is bought' do
      subject.scan(items.first)

      expect(subject.total).to eq(9.25)
    end
  end
  
  context 'applies total discount' do
    let(:total_discount) { true }
    let(:items)          { %w(001 002 003) }

    it 'applies a discount if the basket total is more than £60' do
      items.each do |item|
        subject.scan(item)
      end

      expect(subject.total).to eq(66.78)
    end
  end

  context 'applies all promotions' do
    let(:total_discount) { true }
    let(:multibuy)       { true }
    let(:items)          { %w( 001 002 001 003) }

    it 'applies all promotions' do
      items.each do |item|
        subject.scan(item)
      end

      expect(subject.total).to eq(73.76)
    end
  end
end