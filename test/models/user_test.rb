require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "can't delete last user" do
    user = User.create(name: "Dave", password: "secret")

    assert_equal "Can't delete last user",
      assert_raises(StandardError) { user.destroy }.message
  end
end
