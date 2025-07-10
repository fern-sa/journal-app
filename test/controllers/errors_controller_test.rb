require "test_helper"

class ErrorsControllerTest < ActionDispatch::IntegrationTest
  # include Devise::Test::ControllerHelpers 
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    sign_in @user
  end

  test "should get not_found" do
    get '/any'
    assert_response :missing
  end
end
