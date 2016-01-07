class ShopData
  # In an ideal world, these constants would be in a database or other external resource
  
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

  # My thought with these was that you could have multiple total discounts depending on basket size
  # e.g. 10% on £60; 20% on £100 etc
  # But that was overcomplcating things, so...

  TOTAL_DISCOUNT = {
      'threshold' => 60,
      'discount'  => 10
    }

  MULTIBUY = [
    {
      'applies_to' => '001',
      'threshold'  => 2,
      'new_price'  => 8.5
    }
  ]
end