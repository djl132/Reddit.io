class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

# DISPLAYS VIEW FOR POST AND TAKES IN POST DATA USING FORM_FOR, PASSING DATA TO CREATE
  def new
    @post = Post.new #USE POST OBJECT TO COLLECT DATA  AND PASS TO CREATE ACTION
  end

# CREATES AND SAVES NEW POST TO DB, REDIRECTING TO NEWLY CREATED POST AFTER
# TAKES IN: create new post
  def create
    @post = Post.new
    @post.title = params[:post][:title]
    @post.body = params[:post][:body]  # HERE PARAMS IS STORING POST INFORMATION

#update data, handle errors
    if @post.save
      # save a notice for DISPLAYING IN APPLCAITON LAYOUT.
      flash[:notice] = "Post was created."

      # THIS JUST CALLS THE GET REQUEST PASSING IN THE ID OF THE POST BY DEFAIULT IRHGT?
      redirect_to @post # HERE PARAMS IS STORING POST DATA
    else
      flash.now[:alert] = "There was an error saving the post. Please try again."
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def show
    @post = Post.find(params[:id]) #STORING GET INFORMATION(URL QUERY PARAMS)
  end


   def destroy
     @post = Post.find(params[:id])

 # #8
     if @post.destroy
       flash[:notice] = "\"#{@post.title}\" was deleted successfully."
       redirect_to posts_path
     else
       flash.now[:alert] = "There was an error deleting the post."
       render :show
     end
   end

   def update
      @post = Post.find(params[:id]) #is thsi query url paramertes from edit?
      @post.title = params[:post][:title]
      @post.body = params[:post][:body]

      if @post.save
        flash[:notice] = "Post updated."
        redirect_to @post
      else
        flash.now[:alert] = "Error updating. Try again."
        render :edit
      end
   end
end
