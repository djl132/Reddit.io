require 'rails_helper'

RSpec.describe Post, type: :model do

  # TEST MODEL'S ATTRIBUTES ARE VALID
  # ACTIVE RECORD PROVIDES VALIDATION
  it { is_expected.to belong_to(:topic)}
  it { is_expected.to belong_to(:user) }

  it { is_expected.to have_many(:votes) }
  it { is_expected.to have_many(:favorites) }



  it { is_expected.to validate_presence_of(:title)}
  it { is_expected.to validate_presence_of(:body)}
  it { is_expected.to validate_presence_of(:topic)}

  it { is_expected.to validate_length_of(:title).is_at_least(5) }
  it { is_expected.to validate_length_of(:body).is_at_least(20) }
  it { is_expected.to validate_presence_of(:user) }





  # what is create? who does it belong ot?
# HOW DOES THE USER ATTRIBUTES WORK?
  let(:topic) { create(:topic) }
    let(:user) { create(:user) }
    let(:post) { create(:post) }



  describe "attributes" do
    it "has title,  body, and user attributes" do
      expect(post).to have_attributes(title: post.title, body: post.body)
    end
  end



   describe "voting" do
 # #5
     before do
       3.times { post.votes.create!(value: 1) }
       2.times { post.votes.create!(value: -1) }
       @up_votes = post.votes.where(value: 1).count
       @down_votes = post.votes.where(value: -1).count
     end

 # #6
     describe "#up_votes" do
       it "counts the number of votes with value = 1" do
         expect( post.up_votes ).to eq(@up_votes)
       end
     end

 # #7
     describe "#down_votes" do
       it "counts the number of votes with value = -1" do
         expect( post.down_votes ).to eq(@down_votes)
       end
     end

 # #8
     describe "#points" do
       it "returns the sum of all down and up votes" do
         expect( post.points ).to eq(@up_votes - @down_votes)
       end
     end
   end




end
