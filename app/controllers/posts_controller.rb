class PostsController < ApplicationController
  def index
    @posts = Post.all
    @filtered_posts =
    @posts.each do |post|
        index = @posts.find_index(post)
        post.title = "SPAM" if index == 0 || index%5 == 0
    end

   end

  def show
  end

  def new
  end

  def edit
  end
end
