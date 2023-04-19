# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DailyResultStatsCalculator, type: :service do
  describe '.calculate' do
    let(:subject) { 'Maths' }
    let(:date) { Date.today }

    context 'when there are no results for the given subject and date' do
      it 'returns an empty hash' do
        result = described_class.calculate(date, subject)
        expect(result[:date]).to eq(date)
        expect(result[:subject]).to eq(subject)
        expect(result[:daily_low]).to eq(nil)
        expect(result[:daily_high]).to eq(nil)
        expect(result[:result_count]).to eq(0)
      end
    end

    context 'when there are results for the given subject and date' do
      let!(:result1) { create(:result, subject: subject, created_at: date.to_time + 1.hour, marks: 90) }
      let!(:result2) { create(:result, subject: subject, created_at: date.to_time + 2.hours, marks: 80) }
      let!(:result3) { create(:result, subject: subject, created_at: date.to_time + 3.hours, marks: 70) }

      it 'returns the daily result stats for the given subject and date' do
        result = described_class.calculate(date - 1, subject)

        expect(result[:date]).to eq(date - 1)
        expect(result[:subject]).to eq(subject)
        expect(result[:daily_low]).to eq(70)
        expect(result[:daily_high]).to eq(90)
        expect(result[:result_count]).to eq(3)
      end
    end
  end
end
