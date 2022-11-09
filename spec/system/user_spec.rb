# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'UsersSystem' do
  before do
    driven_by :selenium_chrome_headless
  end

  def fill_in_sign_up_form
    fill_in 'user_email', with: Faker::Internet.email
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
  end

  def fill_in_sign_in_form
    user = create(:user)
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
  end

  def fill_in_edit_form
    fill_in 'user_password', with: 'password2'
    fill_in 'user_password_confirmation', with: 'password2'
  end

  describe 'CRUD' do
    describe 'Sign_up' do
      it 'redirects to home' do
        visit new_user_registration_path
        fill_in_sign_up_form
        check 'Remember me'
        click_button 'Sign up'
        expect(page).to have_content('Welcome! You have signed up successfully.')
      end
    end

    describe 'Sign_in' do
      it 'redirects to home' do
        visit new_user_session_path
        fill_in_sign_in_form
        check 'Remember me'
        click_button 'Sign in'
        expect(page).to have_content('Signed in successfully.')
      end
    end

    describe 'Sign_out' do
      before do
        user = create(:user)
        login_as(user)
      end

      it 'redirects to home' do
        visit root_path
        click_on 'Sign out'
        expect(page).to have_content('Signed out successfully.')
      end
    end

    describe 'Edit' do
      before do
        user = create(:user)
        login_as(user)
      end

      it 'redirects to home' do
        visit edit_user_registration_path
        fill_in_edit_form
        fill_in 'user_current_password', with: 'password'
        click_button 'Update'
        expect(page).to have_content('Your account has been updated successfully.')
      end
    end

    describe 'Destroy' do
      before do
        user = create(:user)
        login_as(user)
      end

      it 'redirects to home' do
        visit edit_user_registration_path
        click_button 'Cancel my account'
        expect(page).to have_content('Bye! Your account has been successfully cancelled. We hope to see you again soon.')
      end
    end
  end
end
