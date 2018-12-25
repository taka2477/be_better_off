require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with proper information for user registration" do
    user = create(:user)
    expect(user).to be_valid
  end

  it "is invalid username" do
    user = User.new()
    user.valid?
    expect(user.errors.messages[:username]).to include("を入力してください")
  end
end
