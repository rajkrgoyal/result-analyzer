# frozen_string_literal: true

class DailyResultStatsCalculator
  def self.calculate(date, subject)
    results = Result.where('DATE(created_at) = ? AND subject = ?', date, subject)
    daily_low = results.minimum(:marks)
    daily_high = results.maximum(:marks)
    result_count = results.count
    DailyResultStat.create(date: date, subject: subject, daily_low: daily_low, daily_high: daily_high,
                           result_count: result_count)

    { date: date, subject: subject, daily_low: daily_low, daily_high: daily_high, result_count: result_count }
  end
end
