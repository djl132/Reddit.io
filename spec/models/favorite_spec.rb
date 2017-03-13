require 'rails_helper'

RSpec.describe Favorite, type: :model do
  let(:topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
     let(:user) { User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "helloworld") }
     let(:post) { topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, user: user) }
     let(:favorite) { Favorite.create!(post: post, user: user) }

     it { is_expected.to belong_to(:post) }
     it { is_expected.to belong_to(:user) }


     describe "#favorite_for(post)" do
       before do
         topic = Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph)
         @post = topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, user: user)
       end

       it "returns `nil` if the user has not favorited the post" do
   # #1
         expect(user.favorite_for(@post)).to be_nil
       end

       it "returns the appropriate favorite if it exists" do
   # #2
         favorite = user.favorites.where(post: @post).create
   # #3
         expect(user.favorite_for(@post)).to eq(favorite)
       end
     end

     


   end
