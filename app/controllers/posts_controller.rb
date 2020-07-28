class PostsController < ApplicationController
  before_action :authenticate_user!, expect: :index
  before_action :set_post, only: :create_favorite 
  def index
    @posts = Post.all
    @user = current_user

  end

  def new
    @post = Post.new
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
    #あとで既にお気に入り追加している場合の条件分岐を書く
  end

  private

  def set_params
    params.require(:post).permit(:content).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
