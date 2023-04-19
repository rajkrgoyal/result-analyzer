# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MonthlyResultAveragesCalculator, type: :service do
  describe '.calculate' do
    context 'success' do
      let(:date) { Date.parse('2022-04-18') }
      let(:subject) { 'Science' }
      let!(:results) do
        [
          create(:result, subject: subject,  marks: 18.90, created_at: Date.parse('2022-04-03')),
          create(:result, subject: subject,  marks: 11.21, created_at: date),
          create(:result, subject: subject,  marks: 12.34, created_at: date),
          create(:result, subject: subject,  marks: 81.44, created_at: date),
          create(:result, subject: subject,  marks: 22.43, created_at: date),
          create(:result, subject: subject,  marks: 57.44, created_at: date),
          create(:result, subject: subject,  marks: 23.12, created_at: date),
          create(:result, subject: subject,  marks: 12.33, created_at: date),
          create(:result, subject: subject,  marks: 12.33, created_at: date - 1),
          create(:result, subject: subject,  marks: 18.33, created_at: date - 1),
          create(:result, subject: subject,  marks: 21.33, created_at: date - 1)
        ]
      end

      it 'returns monthly result when there is a data for previuos days' do
        expected_result = {
          date: date,
          subject: subject,
          monthly_low: 12.21,
          monthly_high: 59.36,
          monthly_result_count: 11
        }

        result = described_class.calculate(subject, date)
        expect(result).to eq(expected_result)
      end
    end

    context 'returns nil when new data is not there for current data' do
      it 'does not calculate the monthly low, high, and result count for the given subject' do
        result = described_class.calculate('Math', Date.parse('2022-04-19'))
        expect(result).to be_nil
      end
    end
  end
end
