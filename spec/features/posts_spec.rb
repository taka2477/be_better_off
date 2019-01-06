require 'rails_helper'

RSpec.feature "Posts", type: :feature do
  given!(:user) { create(:user) }

  background do
    sign_in user
    visit root_path
  end

  scenario "user can post properly" do
    click_on '投稿'
    expect(page).to have_current_path new_post_path
    fill_in 'post_title', with: 'post_title_test'
    fill_in 'post_budget', with: 50000
    fill_in 'post_tag_list', with: 'tagtest'
    fill_in 'post_body', with: 'body_test'
    within('#new_post') do
      click_on '投稿'
    end
    expect(page).to have_current_path posts_path
    within('.table') do
      expect(page).to have_content 'post_title_test'
      expect(page).to have_content "50,000円"
      expect(page).to have_content 'tagtest'
      click_on 'post_title_test'
    end
    expect(page).to have_current_path post_path(user.id)
    expect(page).to have_content user.username
    expect(page).to have_content 'post_title_test'
    expect(page).to have_content "50,000円"
    expect(page).to have_content 'tagtest'
    expect(page).to have_content 'body_test'
  end
end
