require "test_helper"

class CartsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cart = carts(:one)
  end

  test "should get index" do
    get carts_url
    assert_response :success
  end

  test "should get new" do
    get new_cart_url
    assert_response :success
  end

  test "should create cart" do
    assert_difference("Cart.count") do
      post carts_url, params: { cart: {} }
    end

    assert_redirected_to cart_url(Cart.last)
  end

  test "should show cart" do
    get cart_url(@cart)
    assert_response :success
  end

  test "should get edit" do
    get edit_cart_url(@cart)
    assert_response :success
  end

  test "should update cart" do
    patch cart_url(@cart), params: { cart: {} }
    assert_redirected_to cart_url(@cart)
  end

  test "should destroy cart" do
    post line_items_url, params: { product_id: products(:ruby).id }
    @cart = Cart.find(session[:cart_id])

    assert_difference("Cart.count", -1) do
      delete cart_url(@cart)
    end

    assert_redirected_to store_index_url
  end

#test the double cart quantity

 # test "double cart quantity" do
  #  initial_quantity = 0
   # @cart.line_items.each do |line_item| 
    #  initial_quantity = initial_quantity + line_item.quantity
    #end
    #patch double_quantity_cart_path(@cart)
    #@cart.reload
    #sa mai calculez o cantitate care sa fie cea de dupa update, dubla (sa testez ca cantitatea dupa update e de 
    #2x cantitatea intitiala; cant dubla nu e 0)
    #updated_quantity = 0
    #@cart.line_items.each do |line_item| 
     # updated_quantity = updated_quantity + line_item.quantity
    #end
    #assert_redirected_to cart_path(@cart)   # redirect to the cart show page
    #assert_equal 'Total quantity of all items has been doubled.', flash[:notice]  # flash message
    #assert_equal(initial_quantity * 2, updated_quantity)
  #end
#end


#test modificat: un cart sa aiba 3 line_items, line_items sa aiba cantitatile 1, 5 si 10; sa testez ca
#dupa ce am rulat ca, cantitatea s-a dublat

  test "double cart quantity" do
    cart_id = @cart.id
    @cart.line_items.destroy_all  #sterg line itemurile daca sunt mai multe, cu destroy all

    #definesc products si line_items
    product1 = Product.create(title: "Titlu 1", description: "a description", price: 5)
    product2 = Product.create(title: "Titlu 2", description: "a description", price: 5)
    product3 = Product.create(title: "Titlu 3", description: "a description", price: 5)
    
    line_item1 = LineItem.create(product_id: product1.id, cart_id: cart_id, quantity: 1)
    line_item2 = LineItem.create(product_id: product2.id, cart_id: cart_id, quantity: 5)
    line_item3 = LineItem.create(product_id: product3.id, cart_id: cart_id, quantity: 10)

    @cart.reload #se face cart reload, update la cart, dupa care se calculeaza cantitatea intitala
    initial_quantity = 0
    @cart.line_items.each do |line_item| 
      initial_quantity = initial_quantity + line_item.quantity
    end 

    patch double_quantity_cart_path(@cart) #se dubleaza cantitatea tuturor line_items din cart, dupa care se face reload; 
                                          #trimite un request PATCH la o ruta custom, definita in routes (double_quantity), 
                                          #care declanseaza o actiune in CartsController ca sa dubleze cantitatea cartului.
    
    @cart.reload #se face din nou reload la cart dupa dublare
    updated_quantity = 0
    @cart.line_items.each do |line_item| 
      updated_quantity = updated_quantity + line_item.quantity
    end

    assert_redirected_to cart_path(@cart)
    assert_equal 'Total quantity of all items has been doubled.', flash[:notice] 
    assert_equal(initial_quantity * 2, updated_quantity)
  end
end




