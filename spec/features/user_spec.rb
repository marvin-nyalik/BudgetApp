require 'rails_helper'

RSpec.describe 'User authentication', type: :feature do
  before(:each) do
    DatabaseCleaner.clean
  end

  it 'allows a user to register' do
    visit new_user_registration_path

    fill_in 'user_name', with: 'New User'
    fill_in 'user_email', with: 'newuser@example.com'
    fill_in 'user_password', with: 'password123'
    fill_in 'user_password_confirmation', with: 'password123'
    click_button 'Sign up'

    expect(page).to have_text('Welcome! You have signed up successfully.')
  end

  it 'allows user to login' do
    user = FactoryBot.create(:user)

    visit new_user_session_path

    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: 'password123'
    click_button 'Sign in'

    expect(page).to have_text('Categories')
  end
end
