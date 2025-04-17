require "test_helper"

class CartTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    @cart = carts(:one)
  end

  test "total_price is the sum of each line_item" do
    cart_id = @cart.id
    @cart.line_items.destroy_all

            product1 = Product.create(title: "Titlu 1", description: "a description", price: 5)
            product2 = Product.create(title: "Titlu 2", description: "a description", price: 5)
            product3 = Product.create(title: "Titlu 3", description: "a description", price: 5)

            line_item1 = LineItem.create(product_id: product1.id, cart_id: cart_id)
            line_item2 = LineItem.create(product_id: product2.id, cart_id: cart_id)
            line_item3 = LineItem.create(product_id: product3.id, cart_id: cart_id)
            
    assert_equal(line_item1.total_price + line_item2.total_price + line_item3.total_price, @cart.reload.total_price)
  end
end
