require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "can't delete last user" do
    #delete users inainte de test
    User.delete_all

    #create an user
    #verificam ca s-a creat userul
    user = User.create!(name: "Dave", password: "secret") 
    assert user.persisted? 

    #dupa incercam sa stergem ultimul user
    assert_equal "Can't delete last user",
      assert_raises(StandardError) { user.destroy }.message
  end
end
