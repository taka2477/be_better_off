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
      expect(user.errors.full_messages).to include("ユーザー名を入力してください")
    end

    it "is invalid password" do
      expect(user.errors.full_messages).to include("パスワードを入力してください")
    end

    it "is invalid gender" do
      expect(user.errors.full_messages).to include("性別を入力してください")
    end

    it "is invalid age" do
      expect(user.errors.full_messages).to include("年齢を入力してください")
    end

    it "is invalid email" do
      expect(user.errors.full_messages).to include("メールアドレスを入力してください")
    end

    it "is invalid accepted" do
      expect(user.errors.full_messages).to include("利用規約、及び、個人情報の取扱に同意するにチェックしてください")
    end

    it "is invalid with a duplicate email address" do
      FactoryBot.create(:user, email: "foobar@example.com")
      user = FactoryBot.build(:user, email: "foobar@example.com")
      user.valid?
      expect(user.errors.full_messages).to include("メールアドレスはすでに存在します")
    end

    it "is invalid with a duplicate username" do
      FactoryBot.create(:user, username: "hogehoge")
      user = FactoryBot.build(:user, username: "hogehoge")
      user.valid?
      expect(user.errors.full_messages).to include("ユーザー名はすでに存在します")
    end
  end
end
