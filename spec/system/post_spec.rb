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

  describe 'As a visitor' do
    it 'Can see posts' do
      visit posts_path
      expect(page).to have_content('Posts')
    end

    it 'Can see a post' do
      post = create(:post)
      visit posts_path(Post.last)
      expect(page).to have_content(post.title)
    end

    it 'Can not create a post' do
      visit new_post_path
      expect(page).to have_content('You need to sign in or sign up before continuing.')
    end

    it 'Can not edit a post' do
      post = create(:post)
      visit edit_post_path(post)
      expect(page).to have_content('You have to log in to continue.')
    end

    it 'Can not delete a post' do
      visit posts_path
      expect(page).not_to have_content('Destroy')
    end
  end

  describe 'Visiting' do
    before do
      user = create(:user)
      login_as(user)
    end

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
      expect(page).to have_content post.title
    end

    it 'posts#edit' do
      post = create(:post)
      visit edit_post_path(post)
      expect(page).to have_content 'You are not authorized to access this page.'
    end
  end

  describe 'CRUD' do
    before do
      user = create(:user)
      login_as(user)
    end

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

    it '#edit' do
      visit root_path
      click_on 'New post'
      fill_in_post_form('post_content')
      click_button 'Create Post'
      click_on 'Edit this post'
      fill_in_post_form('post_content')
      click_button 'Update Post'
      expect(page).to have_content 'Post was successfully updated.'
    end

    it '#destroy' do
      visit root_path
      click_on 'New post'
      fill_in_post_form('post_content')
      click_button 'Create Post'
      click_on 'Destroy'
      expect(page).to have_content 'Post was successfully destroyed.'
    end
  end
end
