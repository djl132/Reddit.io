require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

# create the user
  let(:my_user){User.create!(name: "Blochead", email: "Blochead@bloc.io", password: "password")}

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST sessions" do
    it "returns http success" do
      post :create, session: {email: my_user.email}
      expect(response).to have_http_status(:success)
    end

# SESSION DEFINES SIGNED IN AS HAVING A USER_ID, which it gets
# from the new view's
    it "initilializes a session" do
      post :create, session: {email: my_user.email, password: my_user.password}

      # confirm that the session starts - session has the user's id
      expect(session[:user_id]).to eq my_user.id
    end

    it "does not add a user id to session if no password" do
      post :create, session: {email: my_user.email}
      expect(session[:user_id]).to be_nil
    end

    it "flashes #error with bad email address" do
      post :create, session: {email: my_user.email}
      expect(flash.now[:alert]).to be_present
    end

    it "renders #new when given bad email" do
      post :create, session: {email: my_user.email}
      expect(response).to render_template :new
    end

    it "redirects to the root view if email and password verified" do
      post :create, session: {email: my_user.email}
      expect(response).to redirect_to(root_path)
    end
  end

  describe "DELETE sessions/id" do
    it "renders the #welcome root (homepage) view" do
      delete :destroy, id: my_user.id
      expect(response).to redirect_to root_path
    end

    it"deletes the user's session" do
      delete :destroy, id: my_user.id
      expect(session[:user_id]).to be_nil
    end

    it "flashes #notice" do
      # route browser to destroy route
      delete :destroy, id: my_user.id
      expect(flash[:notice]).to be_present
    end
  end


end
