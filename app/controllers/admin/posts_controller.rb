class Admin::PostsController < AdminController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:success] = "Post successfully created"
      redirect_to admin_posts_path
    else
      flash[:error] = "Create failed"
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = "Post successfully updated"
      redirect_to admin_posts_path
    else
      flash[:error] = "Update failed"
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:success] = "Post successfully deleted"
    redirect_to admin_posts_path
  end

  private
  def post_params
    params.require(:post).permit(:name, :content, :featured_image)
  end
end