# frozen_string_literal: true

FactoryBot.define do
  factory :monthly_result_average do
    subject { 'Maths' }
    month { "January" }
    monthly_low { 119.80 }
    monthly_high { 139.89 }
    result_count { 20 }
  end
end
