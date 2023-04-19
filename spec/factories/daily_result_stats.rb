# frozen_string_literal: true

FactoryBot.define do
  factory :daily_result_stat do
    subject { 'Maths' }
    date { Date.today }
    daily_low { 119.80 }
    daily_high { 139.89 }
    result_count { 20 }
  end
end
