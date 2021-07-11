class CreateTravels < ActiveRecord::Migration[5.0]
  def change
    create_table :travels do |t|
      t.integer :user_id
      t.string :name
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
