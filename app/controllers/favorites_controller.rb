class FavoritesController < ApplicationController
  before_action :require_sign_in
  # after_action :update_threads

  def create
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.create!(post: post)

    if favorite.save
      flash[:notice] = "Post followed."
    else
      flash[:alert] = "Failed to follow."
    end

    redirect_to [post.topic, post]
  end

  def destroy
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.find(params[:id])

    if favorite.destroy
      flash[:notice] = "Post unfollowed."
    else
      flash[:alert] = "Failed to unfollow."
    end

    redirect_to [post.topic, post]
  end

end
