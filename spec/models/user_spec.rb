require 'rails_helper'

RSpec.describe User, type: :model do
  context "when correct user is created" do
    let(:user){ create(:user) }

    it "is valid with proper information for user registration" do
      expect(user).to be_valid
    end
  end

  context "when each validation works properly" do
    let(:user) { User.create() }

    it "is invalid username" do
      expect(user.errors.messages[:username]).to include("を入力してください")
    end

    it "is invalid password" do
      expect(user.errors.messages[:password]).to include("を入力してください")
    end

    it "is invalid gender" do
      expect(user.errors.messages[:gender]).to include("を入力してください")
    end

    it "is invalid age" do
      expect(user.errors.messages[:age]).to include("を入力してください")
    end

    it "is invalid email" do
      expect(user.errors.messages[:email]).to include("を入力してください")
    end

    it "is invalid accepted" do
      expect(user.errors.messages[:accepted]).to include("にチェックしてください")
    end

    it "is invalid with a duplicate email address" do
      FactoryBot.create(:user, email: "foobar@example.com")
      user = FactoryBot.build(:user, email: "foobar@example.com")
      user.valid?
      expect(user.errors[:email]).to include("はすでに存在します")
    end

    it "is invalid with a duplicate username" do
      FactoryBot.create(:user, username: "hogehoge")
      user = FactoryBot.build(:user, username: "hogehoge")
      user.valid?
      expect(user.errors[:username]).to include("はすでに存在します")
    end
  end
end
