# frozen_string_literal: true

class MonthlyResultAveragesCalculator
  MINIMUM_RESULT_COUNT = 200

  def self.calculate(subject, date)
    date_range = (date - 5.days)..date
    result_count = 0
    return if Result.minimum(:created_at).nil?

    while result_count < MINIMUM_RESULT_COUNT && date_range.first >= Result.minimum(:created_at).to_date

      daily_result_stats = date_range.map { |date| DailyResultStatsCalculator.calculate(date, subject) }

      result_count = daily_result_stats.sum { |stats| stats[:result_count] }

      date_range = (date_range.first - 1.day)..date_range.last if result_count < MINIMUM_RESULT_COUNT
    end
    daily_volumes_sum = daily_result_stats.sum { |stats| stats[:result_count] }
    daily_low_sum = daily_result_stats.map do |stats|
      stats[:daily_low] * stats[:result_count] if stats[:daily_low]
    end.compact.sum
    daily_high_sum = daily_result_stats.map do |stats|
      stats[:daily_high] * stats[:result_count] if stats[:daily_high]
    end.compact.sum
    monthly_low = daily_low_sum / daily_volumes_sum if daily_low_sum
    monthly_high = daily_high_sum / daily_volumes_sum if daily_high_sum
    MonthlyResultAverage.create(month: '', subject: subject, monthly_low: monthly_low.round(2),
                                monthly_high: monthly_high.round(2), result_count: result_count)
    {
      month: date.month,
      subject: subject,
      monthly_low: monthly_low.round(2),
      monthly_high: monthly_high.round(2),
      monthly_result_count: result_count
    }
  end
end
