# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post do
  subject(:post) { build(:post) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:content) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:comments) }
  end

  describe 'rich text' do
    it { is_expected.to have_rich_text(:content) }
  end
end
