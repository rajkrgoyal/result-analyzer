# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DailyResultStat, type: :model do
  let(:daily_stat) { build(:daily_result_stat) }

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(daily_stat).to be_valid
    end

    it 'is not valid without a subject' do
      daily_stat.subject = nil
      expect(daily_stat).not_to be_valid
    end

    it 'is not valid without a daily high' do
      daily_stat.daily_high = nil
      expect(daily_stat).not_to be_valid
    end

    it 'is valid with a valid float' do
      daily_stat.daily_high = 123.67
      expect(daily_stat).to be_valid
    end

    it 'is not valid without a daily low' do
      daily_stat.daily_low = nil
      expect(daily_stat).not_to be_valid
    end

    it 'is not valid without a date' do
      daily_stat.date = nil
      expect(daily_stat).not_to be_valid
    end
  end
end
