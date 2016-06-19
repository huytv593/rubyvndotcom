class Admin::PostsController < AdminController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:success] = "Post successfully created"
      redirect_to admin_post_path(@post)
    else
      flash[:error] = "Create failed"
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:success] = "Post successfully updated"
      redirect_to admin_post_path(@post)
    else
      flash[:error] = "Update failed"
      render :edit
    end
  end

  def destroy
    @post.destroy
    flash[:success] = "Post successfully deleted"
    redirect_to admin_posts_path
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end
  def post_params
    params.require(:post).permit(:name, :content, :featured_image, :category_id)
  end
  def set_category
    @category = Category.find(params[:category_id])
  end
end