require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "helloworld") }

  # create a posts and comments for each individual test
  let(:topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
  let(:post) { topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, user: user) }
  let(:comment) {Comment.create!(body: "comment body", post: post, user: user)}

  it { is_expected.to belong_to(:post) }

  it {is_expected.to belong_to(:user)}

  it {is_expected.to validate_presence_of(:body)}
  it {is_expected.to validate_length_of(:body).is_at_least(5)}

  describe "attributes" do
    it "has body attribute" do
      expect(comment).to have_attributes(body: "comment body")
    end
  end

  describe "after_create" do
 # #22
     before do
       @another_comment = Comment.new(body: 'Comment Body', post: post, user: user)
     end

 # #23
     it "sends an email to users who have favorited the post" do
       favorite = user.favorites.create(post: post)
       expect(FavoriteMailer).to receive(:new_comment).with(user, post, @another_comment).and_return(double(deliver_now: true))

       @another_comment.save!
     end

 # #24
     it "does not send emails to users who haven't favorited the post" do
       expect(FavoriteMailer).not_to receive(:new_comment)

       @another_comment.save!
     end
   end

end
