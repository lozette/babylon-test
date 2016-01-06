class Checkout
    ITEMS = {
    '001' => {
      'name'  => 'Lavender heart',
      'price' => 9.25
    },
    '002' => {
      'name'  => 'Personalised cufflinks',
      'price' => 45
    },
    '003' => {
      'name'  => 'Kids T-shirt',
      'price' => 19.95
    }
  }

  # Ditto these
  TOTAL_DISCOUNT = [
    {
      'threshold' => 60,
      'discount'  => 10
    }
  ]

  MULTIBUY = [
    {
      'applies_to' => 001,
      'threshold'  => 2,
      'new_price'  => 8.5
    }
  ]

  @@basket = []

  def initialize(total_discount: false, multibuy: false)
    @total_discount = total_discount
    @multibuy       = multibuy
  end

  def scan(item)
    price = ITEMS[item]['price']
    @@basket.push({ 'item' => item, 'price' => price }) if price
  end

  def total
    apply_promotions

    @@basket.map {|i| i['price']}.reduce(0, :+)
  end

  private

  def apply_promotions
    apply_multibuy if @multibuy
    apply_discount if @total_discount
  end

  def apply_discount

  end

  def apply_multibuy

  end
end