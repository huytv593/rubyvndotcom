class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @posts = Post.where(category_id: @category.id).page params[:page]
  end
end
