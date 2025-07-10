require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  
  setup do
    @user = users(:one)
    sign_in @user
    @category = categories(:one)
    @task = tasks(:one)
    @count = Task.count
  end

  test "should route to show" do
    get category_task_path(@category, @task)
    assert_response :success
  end

  test "should be able to create a category" do
    post category_tasks_path(@category), params: {task: {name: "tester category", deadline: Date.today, is_complete: false}}
    assert_equal @count + 1, Task.count
  end

  test "update a task" do
    patch category_task_path(@category, @task), params: {task:{name: "updated name"}}
    @task.reload
    assert @task.name == "updated name"
  end

  test "delete a task" do
    assert_difference("Task.count", -1) do
      post delete_task_path(@category, @task)
    end
  end
end

