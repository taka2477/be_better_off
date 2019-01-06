require 'rails_helper'

RSpec.feature "Comments", type: :feature do
  given!(:user) { create(:user) }
  given!(:post) { create(:post) }

  background do
    sign_in user
    visit root_path
  end

  scenario "user can post a comment" do
    within('.navbar') do
      click_on '投稿一覧'
    end
    expect(page).to have_current_path posts_path
    within('.table') do
      click_on post.title
    end
    expect(page).to have_current_path post_path(user.id)
    fill_in 'comment_content', with: 'comment_test'
    click_on 'コメント'
    expect(page).to have_content 'comment_test'
  end
end
