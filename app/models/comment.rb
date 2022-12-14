# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_rich_text :content
  validates :content, presence: true
end
