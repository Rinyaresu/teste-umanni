require 'rails_helper'
require 'cancan/matchers'

RSpec.describe Ability, type: :model do
  subject(:ability) { Ability.new(user) }

  describe 'As a visitor' do
    let(:user) { nil }

    it { is_expected.to be_able_to(:read, Post) }
  end

  describe 'As a user' do
    let(:user) { create(:user) }

    it { is_expected.to be_able_to(:read, Post) }
    it { is_expected.to be_able_to(:create, Post) }
    it { is_expected.to be_able_to(:update, Post) }
    it { is_expected.to be_able_to(:destroy, Post) }

    it { is_expected.to be_able_to(:create, Comment) }
    it { is_expected.to be_able_to(:destroy, Comment) }
  end
end

