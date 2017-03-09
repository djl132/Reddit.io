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

# Shoulda tests for password
it {is_expected.to validate_presence_of(:password)}
it {is_expected.to validate_length_of(:password).is_at_least(6)}
it{is_expected.to have_secure_password} # IS THIS A BCRYPT OR SHOULDA?


# Shoulda tests for password
describe "attributes ov valid user" do
  it "should have name and email attributes" do
    expect(user).to have_attributes(name: "Bloccit User", email: "user@bloccit.com")
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
