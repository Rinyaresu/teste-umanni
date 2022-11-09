require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'after_initialize' do
    it 'sets default role to user' do
      user = User.new
      expect(user.role).to eq('user')
    end
  end

  describe 'associations' do
    it { is_expected.to have_many(:posts) }
    it { is_expected.to have_many(:comments) }
  end
end
