class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

# DISPLAYS VIEW FOR POST AND TAKES IN POST DATA USING FORM_FOR, PASSING DATA TO CREATE
  def new
    @post = Post.new
  end

# CREATES AND SAVES NEW POST TO DB, REDIRECTING TO NEWLY CREATED POST AFTER
  def create
    @post = Post.new
    @post.title = params[:post][:title]
    @post.body = params[:post][:body]  # HERE PARAMS IS STORING POST INFORMATION

    #CAN I FIND OUT WHAT'S IN PARAMS AT THIS POINT?

#update data, handle errors
    if @post.save
      # save a notice for DISPLAYING IN APPLCAITON LAYOUT.
      flash[:notice] = "Post was created."

      # who is issuing th eredirect command speicifcally?
      # THIS JUST CALLS THE GET REQUEST PASSING IN THE ID OF THE POST BY DEFAIULT IRHGT?
      redirect_to @post # HERE PARAMS IS STORING POST DATA
    else
      flash.now[:alert] = "There was an error saving the post. Please try again."
      render :new
    end
  end

  def edit
  end

  def show
    @post = Post.find(params[:id]) #STORING GET INFORMATION(URL QUERY PARAMS)
  end
end
