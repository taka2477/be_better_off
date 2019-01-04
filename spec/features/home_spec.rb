require 'rails_helper'

RSpec.feature "Home", type: :feature do
  given!(:user) { create(:user) }

  scenario "each link works properly" do
    visit root_path
    within('.navbar-nav') do
      click_on "ログイン"
      expect(page).to have_current_path(new_user_session_path)
    end
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    within('.actions') do
      click_on "ログイン"
    end
    within('.navbar') do
      click_on "投稿一覧"
      expect(page).to have_current_path(posts_path)
      click_on "投稿"
      expect(page).to have_current_path(new_post_path)
      click_on "プロフィール"
      expect(page).to have_current_path(user_path(user.id))
      click_on "ログアウト"
      expect(page).to have_current_path(root_path)
    end
  end
end
