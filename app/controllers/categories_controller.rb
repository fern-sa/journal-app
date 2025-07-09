class CategoriesController < ApplicationController
  before_action :authenticate_user!
  def index
    @categories = current_user.categories
  end

  def show
    @category = current_user.categories.find(params[:id])
  end

  def destroy
    @category = current_user.categories.find(params[:id])
    @category.destroy
    redirect_to categories_path, alert: "Category deleted"
  end

  def edit
    @category = current_user.categories.find(params[:id])
  end

  def update
    @category = current_user.categories.find(params[:id])
    if @category.update(category_params)
      redirect_to category_path(@category), notice: "Category name updated"
    else
      flash.now[:alert] = "error"
      render :edit, status: :unprocessable_entity
    end
  end

  def create
    @category = current_user.categories.new(category_params)
    @categories = current_user.categories

    if @category.save
      redirect_to categories_path
    else
      flash.now[:alert] = "error"
      render 'categories/index', status: :unprocessable_entity
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def set_category  
    @category = current_user.categories.find(params[:id])
  end
end
