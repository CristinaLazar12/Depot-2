class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart

  def title
    "#{quantity} × #{product.title}"
  end

  def total_price
    product.price * quantity
  end
end
