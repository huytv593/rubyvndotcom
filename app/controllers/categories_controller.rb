class Admin::CategoriesController < AdminController
  def show
    @category = Category.find(params[:id])
  end
end
