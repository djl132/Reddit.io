require 'rails_helper'

RSpec.describe Question, type: :model do

  # create a posts and comments for each individual test
  let(:question) {Question.create!(title:"title", body:"body", resolved: false)}

  describe "attributes" do
    it "has title, body, resolved attribute" do
      expect(question).to have_attributes(title:"title", body:"body", resolved:false)
    end
  end

end
