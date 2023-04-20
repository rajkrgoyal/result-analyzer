# frozen_string_literal: true

class MonthlyResultAverage < ApplicationRecord
  validates :subject, presence: true
  validates :monthly_high, presence: true
  validates :monthly_low, presence: true
  validates :month, :valid_month?, presence: true

  private
  
  def valid_month?
    Date::MONTHNAMES.include?(month)
  end
end
