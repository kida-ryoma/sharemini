class CategoriesController < ApplicationController
  def show
    posts = Post.all.order("created_at DESC")
    @category_posts = posts.where(category_id: params[:id])
    @post = Post.new
  end
end
