require 'rails_helper'

RSpec.describe Comment, type: :model do

  # create a posts and comments for each individual test
  let(:post) {Post.create!(title:"title", body:"body")}
  let(:comment) {Comment.create!(body: "comment body", post: post)}

  describe "attributes" do
    it "has body attribute" do
      expect(comment).to have_attributes(body: "comment body")
    end
  end

end
