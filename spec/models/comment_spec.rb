require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "helloworld") }

  # create a posts and comments for each individual test
  let(:topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
  let(:post) { topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, user: user) }
  let(:comment) {Comment.create!(body: "comment body", post: post)}

  it { is_expected.to belong_to(:post) }


  describe "attributes" do
    it "has body attribute" do
      expect(comment).to have_attributes(body: "comment body")
    end
  end

end
