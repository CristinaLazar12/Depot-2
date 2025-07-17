require "test_helper"

class SubscriptionTest < ActiveSupport::TestCase
  test "subscription must be valid"
  binding.pry
    assert @subscription.valid?
  end

  test "subscription is invalid without user"
    @subscription.user = nil
    assert_not @subscription.valid?
  end

  test "subscription is invalid without product"
    @subscription.product = nil
    assert_not @subscription.valid?
  end
end
