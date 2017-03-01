require 'rails_helper'

#is 'get :index'just calling the action method and retriving the view?
# does get :faq issue a internet route to get it?
RSpec.describe WelcomeController, type: :controller do
  describe "GET index" do
    it "renders index" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET about" do
    it "renders about" do
      get :about
      expect(response).to render_template("about")
    end
  end

  describe "GET faq" do
    it "renders faq" do
      get :faq
      expect(response).to render_template("faq")
    end
  end
end
