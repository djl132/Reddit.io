require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  let(:my_topic) { Topic.create!(name:  RandomData.random_sentence, description: RandomData.random_paragraph) }
   let (:my_user) {User.create!(name: "Bloccit User" , email: "user@bloccit.com", password: "hellowworld") }
   let(:my_post) {my_topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, user: my_user) }

# NO SESSION HAS BEGUN
context "guest user" do

  describe "GET show" do

    it "returns http success" do
      get :show, topic_id: my_topic.id, id: my_post.id
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, topic_id: my_topic.id, id: my_post.id
      expect(response).to render_template :show
    end

    it "assigns my_post to @post" do
      get :show, topic_id: my_topic.id, id: my_post.id
      expect(assigns(:post)).to eq(my_post)
    end


    describe "GET new" do
      it "returns the user to the sing in page to create a new session" do
        get :new, topic_id: my_topic.id
# #8
        expect(response).to redirect_to(new_session_path)
      end
    end


    describe "POST create" do
      it "returns the user to the sing in page to create a new session" do
        post :create, topic_id: my_topic.id, post: {title: RandomData.random_sentence, body: RandomData.random_paragraph}
# #8
        expect(response).to redirect_to(new_session_path)
      end
    end


    describe "GET edit" do
      it "returns http redirect" do
        get :edit, topic_id: my_topic.id, id: my_post.id
        expect(response).to redirect_to(new_session_path)
      end
    end


    describe "PUT update" do
      it "returns http redirect" do
        new_title = RandomData.random_sentence
        new_body = RandomData.random_paragraph

        put :update, topic_id: my_topic.id, id: my_post.id, post: {title: new_title, body: new_body}
        expect(response).to redirect_to(new_session_path)
      end
    end


    describe "DELETE destroy" do
      it "returns http redirect" do
        delete :destroy, topic_id: my_topic.id, id: my_post.id
        expect(response).to have_http_status(:redirect)
      end
    end


end


context "signed-in user" do
  before do
    create_session(my_user)
  end

  describe "GET show" do
    it "returns http success" do
      get :show, topic_id: my_topic.id, id: my_post.id

      expect(response).to have_http_status(:success)
    end

    it "renders #show view" do
      get :show, topic_id: my_topic.id, id: my_post.id
      expect(response).to render_template :show
    end

    it "assigns my_post to @post" do
      # call get action passing in postid
      get :show, topic_id: my_topic.id, id: my_post.id
      expect(assigns(:post)).to eq(my_post)
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new, topic_id: my_topic.id
      expect(response).to have_http_status(:success)
    end

    it "renders #new view" do
      get :new, topic_id: my_topic.id
      expect(response).to render_template :new
    end

    it "instantiates @post" do
      get :new, topic_id: my_topic.id
      expect(assigns(:post)).not_to be_nil
    end
  end

  describe "POST create" do
    it "increases the number of posts by 1" do
      expect{post :create, topic_id: my_topic.id, post: {title: RandomData.random_sentence, body: RandomData.random_paragraph}}.to change(Post,:count).by(1)
    end

    it "assigns @post to the new post" do
      post :create, topic_id: my_topic.id, post: {title: RandomData.random_sentence, body: RandomData.random_paragraph}
      expect(assigns(:post)).to eq Post.last
    end

    it  "redirects to the new post" do
      post :create, topic_id: my_topic.id, post: {title: RandomData.random_sentence, body: RandomData.random_paragraph}
      expect(response).to redirect_to [my_topic, Post.last]
    end
  end

  describe "GET edit" do
    it "returns http success" do
      get :edit, topic_id: my_topic.id, id: my_post.id
      expect(response).to have_http_status(:success)
    end

    it "renders edit view" do
      get :edit, topic_id: my_topic.id, id: my_post.id
      expect(response).to render_template(:edit)
    end

    it "assigns editeable post to @post" do
      get :edit, topic_id: my_topic.id, id: my_post.id

      #test if successfully assigsn @retrieved post
      post_instance = assigns(:post)

      expect(post_instance.id).to eq(my_post.id)
      expect(post_instance.title).to eq(my_post.title)
      expect(post_instance.body).to eq(my_post.body)
    end
  end

  describe "PUT update" do
    it "updates post with expected attributes" do
      new_title = RandomData.random_sentence
      new_body  = RandomData.random_paragraph

# updatea action with id and post
      put :update, topic_id: my_topic.id, id: my_post.id, post: {title: new_title, body: new_body, user: my_user  }

      updated_post = assigns(:post)

      expect(updated_post.id).to eq my_post.id
      expect(updated_post.title).to eq new_title
      expect(updated_post.body).to eq new_body
    end

    it "redirects to updated post" do
      new_title = RandomData.random_sentence
      new_body  = RandomData.random_paragraph

# updatea action with id and post
      put :update, topic_id: my_topic.id, id: my_post.id, post: {title: new_title, body: new_body, user: my_user}
      expect(response).to redirect_to [my_topic, my_post]
    end
  end

  describe "DELETE destroy" do

    it"deletes the post" do
      delete :destroy, topic_id: my_topic.id, id: my_post.id

      count = Post.where({id: my_post.id}).size

      expect(count).to eq 0
    end


    it "redirects to topic show" do
      delete :destroy, topic_id: my_topic.id, id: my_post.id
      expect(response).to redirect_to my_topic
    end
  end
end


end
