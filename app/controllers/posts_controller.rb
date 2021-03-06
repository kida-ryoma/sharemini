class PostsController < ApplicationController
  before_action :authenticate_user!, expect: :index
  before_action :set_post, only: [:create_favorite , :show]
  
  def index
    @posts = Post.includes(:user).order("created_at DESC")
    @user = current_user
    @post = Post.new
  end

  def show
    @comment = Comment.new
  end

  def create
    @post = Post.new(set_params)
    if @post.valid?
      @post.save
      redirect_to root_path
    else
      redirect_to new_post_path
    end
  end

  def create_favorite
    if @post.favorites.find_by(user_id: current_user.id) == nil
      @post = Favorite.create(user_id: current_user.id, post_id: @post.id)
      respond_to do |format|
        format.html { redirect_to root_path}
        format.json
      end
    else
      @post.favorites.find_by(user_id: current_user.id).destroy
      redirect_to root_path
    end
  end

  private

  def set_params
    params.require(:post).permit(:content,:image, :category_id).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  
end
