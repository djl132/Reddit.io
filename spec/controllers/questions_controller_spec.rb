require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
  let(:my_question){Question.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, resolved: false)}

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns @questions attribute"do
      get :index

      # check if controller's @posts was assigned my_post.
      # by accessing instance variables using assigns
      expect(assigns(:questions)).to eq([my_question])
      puts assigns(:questions)
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

    it "instantiates @question" do
      get :new
      expect(assigns(:question)).not_to be_nil
    end
  end

  describe "POST create" do

    it "increases the number of questions by 1" do
      expect{post :create, question: {title: RandomData.random_sentence, body: RandomData.random_paragraph, resolved: false}}.to change(Question, :count).by(1)
    end

    it "assigns @question to the new question" do
      post :create, question: {title: RandomData.random_sentence, body: RandomData.random_paragraph, resolved: false}
      expect(assigns(:question)).to eq Question.last
    end

    it  "redirects to the new question" do
      post :create, question: {title: RandomData.random_sentence, body: RandomData.random_paragraph,resolved: false}
      expect(response).to redirect_to Question.last
    end

  end

  describe "GET #show" do
    it "returns http success" do
      get :show, {id: my_question.id}
      expect(response).to have_http_status(:success)
    end

    it "renders #show view" do
      get :show, {id: my_question.id}
      expect(response).to render_template :show
    end

    it "assigns my_post to @post" do
      # call get action passing in postid
      get :show, {id: my_question.id}
      expect(assigns(:question)).to eq(my_question)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, {id: my_question.id}
      expect(response).to have_http_status(:success)
    end
    it "renders #edit view" do
      get :edit, {id: my_question.id}
      expect(response).to render_template :edit
    end

    it "assigns target question to question" do
      get :edit, {id: my_question.id}

      question_instance = assigns(:question)

      expect(question_instance.id).to eq my_question.id
      expect(question_instance.title).to eq my_question.title
      expect(question_instance.body).to eq my_question.body
    end

  end

  describe "PUT update" do
    it "updates post with expected attributes" do
      new_title = RandomData.random_sentence
      new_body  = RandomData.random_paragraph

  # updatea action with id and post
      put :update, id: my_question.id, question: {title: new_title, body: new_body,resolved: false}

      updated_question = assigns(:question)

      expect(updated_question.id).to eq my_question.id
      expect(updated_question.title).to eq new_title
      expect(updated_question.body).to eq new_body
    end

    it "redirects to updated post" do
      new_title = RandomData.random_sentence
      new_body  = RandomData.random_paragraph

  # updatea action with id and post
      put :update, id: my_question.id, question: {title: new_title, body: new_body, resolved: false}
      expect(response).to redirect_to(my_question)
    end
  end

  describe "DELETE destroy" do

    it"deletes the question" do
      delete :destroy, {id: my_question.id}

      count = Question.where({id: my_question.id}).size
      expect(count).to eq 0
    end


    it "redirects to posts index" do
      delete :destroy, {id: my_question.id}

      expect(response).to redirect_to questions_path
    end
  end

end
