# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Result, type: :model do
  describe 'validations' do
    let(:result) { build(:result) }
    it 'is valid with valid attributes' do
      expect(result).to be_valid
    end

    it 'is not valid without a subject' do
      result.subject = nil
      expect(result).not_to be_valid
    end

    it 'is not valid without marks' do
      result.marks = nil
      expect(result).not_to be_valid
    end
  end
end
