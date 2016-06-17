class PostsController < ApplicationController

  def show
    @post = Post.find(params[:id])
    @post_name = @post.name
    @post_image = @post.featured_image
    @post_user = User.find(@post.user_id).email
  end
end
