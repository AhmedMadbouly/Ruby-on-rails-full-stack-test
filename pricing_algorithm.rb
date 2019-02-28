class Product
  def initialize(price_reference)
    @price_reference = price_reference
  end

  def price_reference
    @price_reference
  end

  def shipping(price_brackets, tax)
    shipping = 20
    total = 0
    price_brackets.each_with_index do |value, index|
      if @price_reference < value
        total = shipping * tax[index]
        break
      end
    end
    total
  end
end


class Brand
  attr_reader :product
  def initialize(rating, price)
    @rating = rating
    @product = Product.new(price)
  end

  def value
    if @rating == "high"
      @value = 1.1
    elsif @rating == "low"
      @value = 0.9
    else
      @value = 1.0
    end
  end
end

#test
brand = Brand.new("high", 100)
final_price = brand.value * (brand.product.price_reference - brand.product.shipping([15, 25, 50, 75, 100, 200, 400, 600], [0.75, 0.775, 0.8, 0.825, 0.85, 0.875, 0.9, 0.925, 0.95]))
puts("Final= #{final_price.round(1)}")
