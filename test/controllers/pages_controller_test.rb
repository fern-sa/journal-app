require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  # include Devise::Test::ControllerHelpers 
  # include Devise::TestHelpers
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    sign_in @user
  end

  test "should get index" do
    get pages_index_url
    assert_response :success
  end
end
