class PagesController < ApplicationController
  before_action :authenticate_user!
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  def index
    @categories = current_user.categories
  end

  private

  def record_not_found
    redirect_to @category, notice: "No such record exists, redirecting to the #{@category.name} category"
  end
end
