class UsersController < ApplicationController
  before_action :set_user
  def show
    @posts = @user.posts
    @fav_posts = Favorite.where(user_id: @user.id)
    @followings = @user.followings
    @followers = @user.followers
  end

  def edit
  end

  def update
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
