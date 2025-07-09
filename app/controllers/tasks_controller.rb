class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only:[:create, :destroy, :edit, :update, :show]
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
    redirect_to category_path(@category), notice: "Comment deleted"
  end

  def edit
    @task = @category.tasks.find(params[:id])
  end

  def show
    @task = @category.tasks.find(params[:id])
  end

  def update
    @task = @category.tasks.find(params[:id])
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

  def task_params
    params.require(:task).permit(:name,:body,:deadline, :is_completed)
  end
end
