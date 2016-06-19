class PostsController < ApplicationController

  def show
    @post = Post.find(params[:id])

    @comments = @post.comments
    @new_comment = Comment.new
  end
end
