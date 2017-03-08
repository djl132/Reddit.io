class SponsoredPostsController < ApplicationController
  def show
    @spost = SponsoredPost.find(params[:id])
  end

  def new
    # topic id information needed to associate new post
    # with topic, later passed to create
    @topic = Topic.find(params[:topic_id])

    # CREATED TO HOLD TEMPORARAY CREATE DATA
    @spost = SponsoredPost.new
  end

  def create
    @topic = Topic.find(params[:topic_id])
    # CREATES THE ACTUAL POST
    @spost = SponsoredPost.new
    @spost.topic = @topic


    @spost.title = params[:sponsored_post][:title]
    @spost.body = params[:sponsored_post][:body]
    @spost.price = params[:sponsored_post][:price]

    if @spost.save
      flash[:notice] = "Sponsored post successfully saved"
      redirect_to [@topic, @spost]
    else
      flash.now[:alert] = "Error posting sponsored post."
      render :new
    end

  end

  def edit
    @spost = SponsoredPost.find(params[:id])
  end

  def update
    @spost = SponsoredPost.find(params[:id])
    @spost.title = params[:sponsored_post][:title]
    @spost.body = params[:sponsored_post][:body]
    @spost.price = params[:sponsored_post][:price]

    if @spost.save
      flash[:notice] = "Sponsored post successfully updated"
      redirect_to [@spost.topic, @spost]
    else
      flash.now[:alert] = "Error posting sponsored post."
      render :edit
    end
  end

  def destroy
    @spost = SponsoredPost.find(params[:id])

    if @spost.destroy
      flash[:notice] = "\"#{@spost.title}\" was deleted successfully."
      redirect_to [@spost.topic]
    else
      flash.now[:alert] = "Error deleting post."
      render [@spost.topic, @spost]
    end
  end

end
