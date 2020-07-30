class CategoriesController < ApplicationController
  def show
    posts = Post.all
    @category_posts = posts.where(category_id: params[:id])
    @post = Post.new
  end
end
