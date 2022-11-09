# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'CommentsFlow' do
  before do
    driven_by :selenium_chrome_headless
  end

  def fill_in_comment_form(id)
    find(:css, "##{id}").click.set(Faker::Lorem.paragraph)
  end

  describe 'CRUD' do
    before do
      user = create(:user)
      login_as(user)
      @post = create(:post)
    end

    it '#create' do
      visit post_path(Post.last)
      fill_in_comment_form('comment_content')
      click_button 'Reply'
      expect(page).to have_content 'Comment was successfully created.'
    end

    it '#delete' do
      visit post_path(Post.last)
      fill_in_comment_form('comment_content')
      click_button 'Reply'
      click_button 'Delete'
      expect(page).to have_content 'Comment was successfully destroyed.'
    end
  end
end
