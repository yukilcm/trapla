class CreateTravels < ActiveRecord::Migration[5.0]
  def change
    create_table :travels do |t|
      t.integer :user_id
      t.string :name
      t.date :start_date
      t.date :end_date

      t.timestamps

      t.index ['user_id'], name: 'index_travels_on_user_id'
    end
  end
end
