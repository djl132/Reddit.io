require 'rails_helper'

RSpec.describe User, type: :model do

  # wait I thought that it was password_digest????
  let(:user) { User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "password") }

# Shoulda tests for name
it { is_expected.to validate_presence_of(:name) }
it { is_expected.to validate_length_of(:name).is_at_least(1) }

# Shoulda tests for email
it {is_expected.to validate_presence_of(:email)}
it {is_expected.to validate_length_of(:email).is_at_least(3)}
it {is_expected.to validate_uniqueness_of(:email)}
            # awhat exactly is this doing?
it {is_expected.to allow_value("user@bloccit.com").for(:email)}
it {is_expected.to have_many(:posts)}
# Shoulda tests for password
it {is_expected.to validate_presence_of(:password)}
it {is_expected.to validate_length_of(:password).is_at_least(6)}
it{is_expected.to have_secure_password} # IS THIS A BCRYPT OR SHOULDA?


it {is_expected.to have_many(:posts)}
it { is_expected.to have_many(:comments) }


# Shoulda tests for password
describe "attributes on valid user" do
  it "should have name and email attributes" do
    expect(user).to have_attributes(name: "Bloccit User", email: "user@bloccit.com")
  end


  it "responds to role" do
      expect(user).to respond_to(:role)
    end

# #2
    it "responds to admin?" do
      expect(user).to respond_to(:admin?)
    end

# #3
    it "responds to member?" do
      expect(user).to respond_to(:member?)
    end
  end

  describe "roles" do
# #4
    it "is member by default" do
      expect(user.role).to eql("member")
    end

# #5
    context "member user" do
      it "returns true for #member?" do
        expect(user.member?).to be_truthy
      end

      it "returns false for #admin?" do
        expect(user.admin?).to be_falsey
      end
    end

# #6
    context "admin user" do
      # set user to admin
      before do
        user.admin!
      end

      it "returns false for #member?" do
        expect(user.member?).to be_falsey
      end

      it "returns true for #admin?" do
        expect(user.admin?).to be_truthy
      end
    end
  end

describe "invalid user" do
  let(:user_with_invalid_name) {User.new(name:"", email:"user@bloccit.com")}
  let(:user_with_invalid_email) {User.new(name:"Bloccit User", email: "")}
  let(:user_with_invalid_password) {User.new(name:"Bloccit User", email: "user@bloccit.com", password: "")}
  it "should expect invalid user due to blank name" do
    expect(user_with_invalid_name).to_not be_valid
  end
  it "should expect invalid user due to blank name" do
    expect(user_with_invalid_email).to_not be_valid
  end
  it "should expect invalid user due to blank password" do
    expect(user_with_invalid_password).to_not be_valid
  end
end


end
