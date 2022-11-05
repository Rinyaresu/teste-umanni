# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post do
  subject(:post) { build(:post) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:content) }
  end
end
