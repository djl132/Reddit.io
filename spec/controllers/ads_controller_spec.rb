require 'rails_helper'

RSpec.describe AdsController, type: :controller do

  # CREATE AD test object
  let (:my_ad) {Ad.create!({title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 5})}

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns @ad attribute"do
      get :index
      # check if controller's @posts was assigned my_post.
      # by accessing instance variables using assigns
      expect(assigns(:ads)).to eq([my_ad])
      puts assigns(:ads)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, {id: my_ad.id}

      # DOES THIS MEAN THAT IT IS A VALID ROUTE? WHAT EXACTLY IS THIS CHECKING?
      expect(response).to have_http_status(:success)
    end

    it "renders #show view" do
      get :show, {id: my_ad.id}
      expect(response).to render_template :show
    end

    it "assigns my_ad to @post" do
      # call get action passing in postid
      get :show, {id: my_ad.id}
      expect(assigns(:ad)).to eq(my_ad)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders #new view" do
      get :new
      expect(response).to render_template :new
    end

    it "instantiates @ad" do
      get :new
      expect(assigns(:ad)).not_to be_nil
    end
  end

  describe "POST create" do
    it "increases the number of ads by 1" do
      # creating a POST REQUES TO CREATE AN AD??
      expect{post :create, ad: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 1}}.to change(Ad, :count).by(1)
    end

    it "created new ad" do

      # WHAT IS GOIN ON HERE?????
      post :create, ad: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 1}
      expect(assigns(:ad)).to eq Ad.last
    end

    it  "redirects to the new post" do
      post :create, ad: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 1}
      expect(response).to redirect_to  Ad.last
    end
  end


  # describe "GET #edit" do
  #   it "returns http success" do
  #     get :edit
  #     expect(response).to have_http_status(:success)
  #   end
  #
  #
  # end

end
