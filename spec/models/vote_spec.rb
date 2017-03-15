require 'rails_helper'

RSpec.describe Vote, type: :model do
    let(:topic) { cre ate(:topic) }
     let(:user) { create(:user) }
     let(:post) { create(:post) }
     let(:vote) { Vote.create!(value: 1, post: post, user: user) }

# #1
it { is_expected.to belong_to(:post) }
it { is_expected.to belong_to(:user) }
# #2
it { is_expected.to validate_presence_of(:value) }
# #3

it { is_expected.to validate_inclusion_of(:value).in_array([-1,1])}




end
