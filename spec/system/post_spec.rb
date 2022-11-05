# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'PostsSystem' do
  before do
    driven_by :selenium_chrome_headless
  end

  def fill_in_post_form(id)
    fill_in 'Title', with: Faker::Lorem.sentence
    find(:css, "##{id}").click.set(Faker::Lorem.paragraph)
  end

  describe 'Visiting' do
    it 'posts#index' do
      visit root_path
      expect(page).to have_content 'Posts'
    end

    it 'posts#new' do
      visit new_post_path
      expect(page).to have_content 'New post'
    end

    it 'posts#show' do
      post = create(:post)
      visit post_path(post)
      expect(page).to have_content 'Title:'
    end

    it 'posts#edit' do
      post = create(:post)
      visit edit_post_path(post)
      expect(page).to have_content 'Editing post'
    end
  end

  describe 'CRUD' do
    it '#create' do
      visit root_path
      click_on 'New post'
      fill_in_post_form('post_content')
      click_button 'Create Post'
      expect(page).to have_content 'Post was successfully created.'
    end

    it '#show' do
      post = create(:post)
      visit post_path(post)
      expect(page).to have_content post.title
    end

    it '#update' do
      post = create(:post)
      visit edit_post_path(post)
      fill_in_post_form('post_content')
      click_button 'Update Post'
      expect(page).to have_content 'Post was successfully updated.'
    end

    it '#destroy' do
      post = create(:post)
      visit post_path(post)
      click_on 'Destroy'
      expect(page).to have_content 'Post was successfully destroyed.'
    end
  end
end

