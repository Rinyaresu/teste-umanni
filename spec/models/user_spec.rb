require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'after_initialize' do
    it 'sets default role to user' do
      user = User.new
      expect(user.role).to eq('user')
    end
  end
end
