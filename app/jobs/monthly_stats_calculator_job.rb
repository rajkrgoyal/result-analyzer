class MonthlyStatsCalculatorJob < ApplicationJob
  queue_as :default

  def perform(subject, date)
    MonthlyResultAveragesCalculator.calculate(subject, date)

  end

  def self.schedule
    # Get the date of the third Wednesday of the current month
    third_wednesday = Date.new(Date.today.year, Date.today.month, 1).next_month.advance(:days => 20)
    while third_wednesday.wday != 3 do
      third_wednesday = third_wednesday.next_day
    end

    Delayed::Job.enqueue(
      self.new
      priority: 0, # Set the priority of the job to 0 (the default is 0)
      run_at: third_wednesday.to_time + 18.hours, # Set the time when the job should run
      queue: "default" # Set the name of the queue where the job should be enqueued
    )
  end
end

