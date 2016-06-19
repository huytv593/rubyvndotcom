class Admin::CategoriesController < AdminController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    @category = Category.new(category_params)

      if @category.save
        flash[:success] = 'Category was successfully created.'
        redirect_to admin_category_path(@category)
      else
        render :new
      end
  end

  def update
      if @category.update(category_params)
        flash[:success] = 'Category was successfully updated.'
        redirect_to admin_category_path(@category)
      else
        render :edit
      end
  end

  def destroy
    if @category.destroy
      flash[:success] = 'Category was successfully deleted.'
    end
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name, :description, :featured_image)
    end
end
