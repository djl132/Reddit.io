class PostsController < ApplicationController

 # require sign in to CRU posts excapt for show
before_action :require_sign_in, except: :show

before_action :authorize_user, except: [:show, :new, :create]


# DISPLAYS VIEW FOR POST AND TAKES IN POST DATA USING FORM_FOR, PASSING DATA TO CREATE
  def new
    # ALLOWS THE ROUTE TO GET THE TOPIC ID OF THE TOPID TO WHICH YOU ARE CREATING A POST
    @topic = Topic.find(params[:topic_id])
    @post = Post.new #USE POST OBJECT TO COLLECT DATA  AND PASS TO CREATE ACTION
  end

# CREATES AND SAVES NEW POST TO DB, REDIRECTING TO NEWLY CREATED POST AFTER
# TAKES IN: create new post

# PARAMS IS TAKING IN THE ID OF TOPIC, FROM THE FORM_FOR? OR THE URL?
  def create
    @topic = Topic.find(params[:topic_id])

    # creates(BUILDS) post in a topic with the ALLOWED attributes and associated user
    @post = @topic.posts.build(post_params)
    @post.user = current_user

#update data, handle errors
    if @post.save
      # save a notice for DISPLAYING IN APPLCAITON LAYOUT.
      flash[:notice] = "Post was created."

      # THIS JUST CALLS THE GET REQUEST PASSING IN THE ID OF THE POST BY DEFAIULT IRHGT?
      redirect_to [@topic, @post] # HERE PARAMS IS STORING POST DATA
    else
      flash.now[:alert] = "There was an error saving the post. Please try again."
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def show
    #IS THIS ENOUGH???????????????WHA  AOBUT TOPIC?????
    @post = Post.find(params[:id]) #STORING GET INFORMATION(URL QUERY PARAMS)
  end


   def destroy
     @post = Post.find(params[:id])

 # #8
     if @post.destroy
       flash[:notice] = "\"#{@post.title}\" was deleted successfully."
       redirect_to @post.topic
     else
       flash.now[:alert] = "There was an error deleting the post."
       render :show
     end
   end



 # HOW IS INFORMATION GETTING PASSES INTO PARAMS HERE?
   def update
      @post = Post.find(params[:id]) #is thsi query url paramertes from edit?

# UPDATE ATTRIBUTES
      @post.assign_attributes(post_params)

      if @post.save
        flash[:notice] = "Post updated."
        redirect_to [@post.topic, @post]
      else
        flash.now[:alert] = "Error updating. Try again."
        render :edit
      end
   end




  private

  # ALLOW CONTROLLERS TO USE  PARAMS TO MASS ASSIGN A RESOURCE
  # RETURNS ATTRIBUTES OF AN OBJECT PARAMS
    def post_params

      # WHAT DOES PARAMS.REQUIRE DO?
      params.require(:post).permit(:title, :body)
    end


    def authorize_user
         post = Post.find(params[:id])
     # #11
         unless current_user == post.user || current_user.admin?
           flash[:alert] = "You must be an admin to do that."
           redirect_to [post.topic, post]
         end
     end



     def authorize_user
      #  get the post you want to CRUD
       post = Post.find(params[:id])

       unless current_user == post.user || current_user.admin?
         flash[:alert] = "You must be an admin to do that."
         redirect_to [post.topic, post]
       end
     end


end
