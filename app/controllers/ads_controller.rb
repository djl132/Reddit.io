class AdsController < ApplicationController
  def new
    @ad = Ad.new
  end

  def edit
  end

  def index
    @ads = Ad.all
  end

  def show
    @ad = Ad.find(params[:id])
  end

  def create
    @ad = Ad.new

    #use params to get POST INFO from new View
    @ad.title = params[:ad][:title]
    @ad.body = params[:ad][:body]
    @ad.price = params[:ad][:price]

    if @ad.save
      flash[:notice] = "Ad posted"
      redirect_to @ad # show ad in show view - browser routes SHOW action/view
    else
      flash.now[:alert] = "Error occured. Try again."
      render :new # renders the view for new ad
    end
  end
end
