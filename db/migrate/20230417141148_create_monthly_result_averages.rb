class CreateMonthlyResultAverages < ActiveRecord::Migration[7.0]
  def change
    create_table :monthly_result_averages do |t|
      t.string :month
      t.string :subject
      t.float :monthly_low
      t.float :monthly_high
      t.integer :result_count

      t.timestamps
    end
  end
end
