require 'rails_helper'

RSpec.describe Answer, type: :model do

  # create a posts and comments for each individual test
  let(:question) {Question.create!(title:"title", body:"body", resolved: false)}
  let(:answer) {Answer.create!(body: "answer body", question: question)}

  describe "attributes" do
    it "has body attribute" do
      expect(answer).to have_attributes(body: "answer body")
    end
  end

end
