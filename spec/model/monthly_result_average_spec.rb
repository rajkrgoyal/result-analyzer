# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MonthlyResultAverage, type: :model do
  describe 'validations' do
    let(:monthly_result) { build(:monthly_result_average) }
    it 'is valid with valid attributes' do
      expect(monthly_result).to be_valid
    end

    it 'is not valid without a subject' do
      monthly_result.subject = nil
      expect(monthly_result).not_to be_valid
    end

    it 'is not valid without a monthly high' do
      monthly_result.monthly_high = nil
      expect(monthly_result).not_to be_valid
    end

    it 'is not valid without a monthly low' do
      monthly_result.monthly_low = nil
      expect(monthly_result).not_to be_valid
    end

    it 'is not valid without a month' do
      monthly_result.month = nil
      expect(monthly_result).not_to be_valid
    end
  end
end
