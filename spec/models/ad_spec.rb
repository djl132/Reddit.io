require 'rails_helper'

RSpec.describe Ad, type: :model do

  let (:ad) {Ad.create!(title: "New Ad Title", body: "New Ad Body", price: "1")}

  describe "attributes" do
    it "has correct attributes" do
      expect(ad).to have_attributes(title: "New Ad Title", body: "New Ad Body", price: "1")
    end
  end

end
