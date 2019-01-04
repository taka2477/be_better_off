require 'rails_helper'

RSpec.feature "Users", type: :feature do
  given!(:user) { create(:user) }

  background do
    sign_in user
    visit root_path
  end

  scenario "profile shows correct information of the user" do
    click_on "プロフィール"
    within('.inner') do
      expect(page).to have_content user.username
      expect(page).to have_content user.email
      expect(page).to have_content user.age
      expect(page).to have_content user.gender
    end
  end

  scenario "user can edit your information" do
    visit user_path(user.id)
    click_on "編集"
    expect(page).to have_current_path(edit_user_registration_path)
    within('.edit_user') do
      fill_in 'user_username', with: "hogehoge"
      fill_in 'user_password', with: user.password
      # within('.actions') do
      #   button = find_button '更新'
      #   click_on button
      # end
    end
    # expect(page).to have_current_path root_path
    # click_on "プロフィール"
    # within('.inner') do
    #   expect(page).to have_content "hogehoge"
    # end
  end
end
