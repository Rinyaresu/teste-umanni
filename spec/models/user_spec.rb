# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  describe 'after_initialize' do
    it 'sets default role to user' do
      user = described_class.new
      expect(user.role).to eq('user')
    end
  end

  describe 'associations' do
    it { is_expected.to have_many(:posts) }
    it { is_expected.to have_many(:comments) }
  end
end
