require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  include Devise::Test::IntegrationHelpers
  setup do
    @user = users(:one)
    sign_in @user
  end

  test "create category" do
    category = Category.new(name: "test", user: @user)
    assert category.save
  end

  test "category requires a name" do
    category = Category.new(name: "", user: @user)
    assert_not category.save
  end

  test "category requires a user" do
    category = Category.new(name: "testing")
    assert_not category.save
  end

end
