class PagesController < ApplicationController
  def home
    @posts = Post.all.page params[:page]
  end

  def about
  end

  def contact
  end
end
