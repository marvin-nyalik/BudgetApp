require 'rails_helper'

RSpec.describe 'Categories management', type: :feature do
  before(:each) do
    DatabaseCleaner.clean
  end

  before(:each) do
    user = FactoryBot.create(:user)

    visit new_user_session_path

    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: 'password123'
    click_button 'Sign in'
    sleep(1)
  end

  it 'allows a user to add a category' do
    visit new_category_path
    sleep(1)

    fill_in 'name', with: 'Apple Pie'
    fill_in 'icon', with: 'icon'

    within('form') do
      click_button 'Add Category'
    end
    sleep(1)
    expect(page).to have_text('Category added')
  end

  it 'allows a user to view category transactions' do
    visit new_category_path
    sleep(1)

    fill_in 'name', with: 'Apple Pie'
    fill_in 'icon', with: 'icon'

    within('form') do
      click_button 'Add Category'
    end
    sleep(1)
    expect(page).to have_text('Category added')
    click_link('Apple Pie')
    sleep(1)
    expect(page).to have_text('$0')
  end
end
