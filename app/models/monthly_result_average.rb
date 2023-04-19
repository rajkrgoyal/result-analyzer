# frozen_string_literal: true

class MonthlyResultAverage < ApplicationRecord
  validates :subject, presence: true
  validates :monthly_high, presence: true
  validates :monthly_low, presence: true
  validates :month, presence: true
end
