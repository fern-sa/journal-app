require "test_helper"


class UserTest < ActiveSupport::TestCase
  include Devise::Test::IntegrationHelpers

  test "create user" do
    user = User.new(email: "testing123@gmail.com", password: "test123")
    assert user.save
  end

  test "doesn't make user with same email" do
    user = User.new(email: "tester123@gmail.com", password: "test123")
    assert_not user.save
  end

end
