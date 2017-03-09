class TopicsController < ApplicationController

  def index
    @topics = Topic.all
  end


  def new
      @topic = Topic.new
  end


  def create
    @topic = Topic.new
    @topic.name = params[:topic][:name]
    @topic.description = params[:topic][:description]
    @topic.public = params[:topic][:public]


    if @topic.save
      redirect_to @topic, notice: "Topic was saved successfully."
    else
      flash.now[:alert] = "Error. Try again."
      render :new
    end

  end


  def edit
      @topic = Topic.find(params[:id])
  end

  def update

    @topic = Topic.find(params[:id])

    @topic.name = params[:topic][:name]
    @topic.description = params[:topic][:description]
    @topic.public = params[:topic][:public]

    if @topic.save
       flash[:notice] = "Topic was updated."
      redirect_to @topic
    else
      flash.now[:alert] = "Error updating topic. Please try again."
      render :edit
    end

  end

  def destroy
    @topic = Topic.find(params[:id])

    if @topic.destroy
      flash[:notice] = "Topic was successfully deleted."
      redirect_to action: :index
    else
      flash.now[:alert] = "There was an error deleting the topic."
      render :show
    end
  end


  def show
    @topic = Topic.find(params[:id])
  end

end
