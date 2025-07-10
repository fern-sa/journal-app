class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only:[:create, :destroy, :edit, :update, :show]
  before_action :set_task, only:[:destroy, :edit, :show, :update]
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def create
    @task = @category.tasks.new(task_params)
    if @task.save
      redirect_to category_path(@category), notice: "task added"
    else
      redirect_to category_path(@category), notice: "error"
    end
  end

  def destroy
    @task = @category.tasks.find(params[:id])
    @task.destroy
    redirect_to category_path(@category), notice: "Task deleted"
  end

  def edit; end

  def show; end

  def update
    if @task.update(task_params)
      redirect_to category_path(@category), notice: "Task updated"
    else
      render :edit
    end
  end

  private
  def set_category  
    @category = current_user.categories.find(params[:category_id])
  end

  def set_task
    @task = @category.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name,:body,:deadline, :is_completed)
  end

  def record_not_found
    redirect_to @category, notice: "No such record exists, redirecting to the #{@category.name} category"
  end
end
