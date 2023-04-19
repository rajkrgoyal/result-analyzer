# frozen_string_literal: true

class DailyResultStat < ApplicationRecord
  validates :subject, presence: true
  validates :daily_high, presence: true
  validates :daily_low, presence: true
  validates :date, presence: true
end
