require "test_helper"

class SubscriptionTest < ActiveSupport::TestCase
  test "subscription must be valid" do
  binding.pry
    assert @subscription.valid?
  end

  test "subscription is invalid without user" do
    @subscription.user = nil
    assert_not @subscription.valid?
  end

  test "subscription is invalid without product" do
    @subscription.product = nil
    assert_not @subscription.valid?
  end
end
