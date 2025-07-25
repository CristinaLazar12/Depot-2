require "test_helper"

class SubscriptionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create!(name: "Dave", password: "password")
    @product = Product.create!(title: "Test Book", author: "Author")
    @subscription = Subscription.create!(user: @user, product: @product, active: true)
  end

   test "should get index" do
    get subscriptions_url
    assert_response :success
  end

  test "should get new" do
    get new_subscription_url
    assert_response :success
  end

  test "should show subscription" do
    get subscription_url(@subscription)
    assert_response :success
  end

  test "should create subscription" do
    assert_difference("Subscription.count") do
      post subscriptions_url, params: {
        subscription: {
          user_id: @user.id,
          product_id: @product.id,
          active: true
        }
      }
    end

    assert_redirected_to subscription_path(Subscription.last)
  end

  test "should get edit" do
    get edit_subscription_url(@subscription)
    assert_response :success
  end

  test "should update subscription" do
    patch subscription_url(@subscription), params: {
      subscription: { active: false }
    }

    assert_redirected_to subscription_path(@subscription)
    @subscription.reload
    assert_not @subscription.active
  end

  test "should destroy subscription" do
    assert_difference("Subscription.count", -1) do
      delete subscription_url(@subscription)
    end

    assert_redirected_to subscriptions_path
  end
end
