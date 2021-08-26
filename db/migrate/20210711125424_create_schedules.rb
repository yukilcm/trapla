class CreateSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :schedules do |t|
      t.integer :travel_id
      t.timestamp :start_at, null: false
      t.timestamp :end_at, null: false
      t.string :title, null: false
      t.string :memo

      t.timestamps
    end
  end
end
