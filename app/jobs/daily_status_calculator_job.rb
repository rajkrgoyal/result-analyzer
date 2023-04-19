# frozen_string_literal: true

class DailyStatusCalculatorJob < ApplicationJob
  queue_as :default

  def perform(subject, data)
    DailyResultStatsCalculator.calculate(subject, data)
  end

  def self.schedule
    Delayed::Job.enqueue(
      new('subject', 'data'), # Replace "subject" and "data" with the actual arguments
      priority: 0, # Set the priority of the job to 0 (the default is 0)
      run_at: Time.zone.parse('6:00 pm').today + 1.day, # Set the time when the job should run
      queue: 'default' # Set the name of the queue where the job should be enqueued
    )
  end
end
