class CreateDailyResultStats < ActiveRecord::Migration[7.0]
  def change
    create_table :daily_result_stats do |t|
      t.string :subject
      t.float :daily_low
      t.float :daily_high
      t.integer :result_count
      t.date :date

      t.timestamps
    end
  end
end
