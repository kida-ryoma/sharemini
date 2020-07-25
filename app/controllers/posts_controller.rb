class PostsController < ApplicationController
  before_action :authenticate_user!, expect: :index
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

  private

  def set_params
    params.require(:post).permit(:content).merge(user_id: current_user.id)
  end
end
