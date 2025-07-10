require "test_helper"

class TaskTest < ActiveSupport::TestCase
  include Devise::Test::IntegrationHelpers
  setup do
    @user = users(:one)
    sign_in @user
    @category = categories(:one)
  end

  test "creates a task" do
    task = Task.new(name: "new task", category: @category, deadline: Date.today)
    assert task.save
  end

  test "fails to create task without deadline" do
    task = Task.new(name: "new task", category: @category)
    assert_not task.save
  end
end
