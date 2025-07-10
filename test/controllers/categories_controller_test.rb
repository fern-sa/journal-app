require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  
  setup do
    @user = users(:one)
    sign_in @user
    @category = categories(:one)
    @count = Category.count
  end

  test "should route to index" do
    get categories_path
    assert_response :success
  end

  test "should route to show category" do
    get category_path(@category)
    assert_response :success
  end

  test "should be able to create a category" do
    post categories_path, params: {category: {name: "tester category"}}
    assert @count + 1 ==  Category.count
  end

  test "update a category" do
    patch category_path(@category), params: {category:{name: "updated name"}}
    @category.reload
    assert @category.name == "updated name"
  end

  test "delete a category" do
    assert_difference("Category.count", -1) do
      post delete_category_url(@category)
    end
  end

  test "should redirect if logged out" do
    sign_out @user
    get categories_path
    assert_response :redirect
  end
end
