require 'shop_data.rb'

class Checkout

  def initialize(total_discount: false, multibuy: false)
    @total_discount = total_discount
    @multibuy       = multibuy
    @basket         = []
  end

  def scan(item)
    price = ShopData::ITEMS[item]['price']
    @basket.push({ 'item' => item, 'price' => price }) if price
  end

  def total
    apply_multibuy
    apply_discount
  end

  private

  def apply_multibuy
    return unless @multibuy

    ShopData::MULTIBUY.each do |offer|
      applies_to     = offer['applies_to']
      relevant_items = @basket.count { |i| i['item'] == applies_to }

      if can_apply_promotion(relevant_items, offer['threshold'])
        @basket.map do |i|
          i['price'] = offer['new_price'] if i['item'] == applies_to
        end
      end
    end
  end

  def apply_discount
    total = @basket.map {|i| i['price']}.reduce(0, :+)
    return total unless @total_discount

    discount = ShopData::TOTAL_DISCOUNT
    
    if can_apply_promotion(total, discount['threshold'])
      total = total - (total * to_percent(discount['discount']))
      total.round(2)
    end
  end

  def can_apply_promotion(num, threshold)
    num >= threshold
  end

  def to_percent(num)
    num.to_f / 100
  end
end