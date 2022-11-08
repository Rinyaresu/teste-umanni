# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Comments' do
  let(:valid_attributes) { attributes_for(:comment) }
  let(:invalid_attributes) { attributes_for(:invalid_comment) }

  describe 'CRUD' do
    before do
      user = create(:user)
      login_as(user)
      @post = create(:post)
    end

    describe 'POST /create' do
      context 'with valid attributes' do
        it 'creates a comment' do
          expect do
            post post_comments_path(Post.last), params: { comment: valid_attributes }
          end.to change(Comment, :count).by(1)
        end

        it 'redirects to the post' do
          post post_comments_path(Post.last), params: { comment: valid_attributes }
          expect(response).to redirect_to(post_path(@post))
        end
      end

      context 'with invalid attributes' do
        it 'does not create a comment' do
          expect do
            post post_comments_path(Post.last), params: { comment: invalid_attributes }
          end.not_to change(Comment, :count)
        end

        it 'renders a response with 422 status' do
          post post_comments_path(Post.last), params: { comment: invalid_attributes }
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    describe 'DELETE /destroy' do
      it 'deletes a comment' do
        comment = create(:comment, post: Post.last)
        expect do
          delete post_comment_path(Post.last, comment)
        end.to change(Comment, :count).by(-1)
      end

      it 'redirects to post' do
        comment = create(:comment, post: Post.last)
        delete post_comment_path(Post.last, comment)
        expect(response).to redirect_to(post_path(Post.last))
      end
    end
  end
end
