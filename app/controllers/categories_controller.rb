class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only:[:show, :destroy, :edit, :update]
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActiveRecord::InvalidForeignKey, with: :invalid_foreign_key


  def index
    @categories = current_user.categories
  end

  def show; end

  def destroy
    @category.destroy
    redirect_to categories_path, alert: "Category deleted"
  end

  def edit; end

  def new; end

  def update
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

  def record_not_found
    redirect_to categories_path, notice: "No such record exists, redirecting to mananage categories"
  end

  def invalid_foreign_key
    redirect_to categories_path, notice: "Category can't be deleted, it still has"
  end
end
