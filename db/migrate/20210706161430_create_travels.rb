class CreateTravels < ActiveRecord::Migration[5.0]
  def change
    create_table :travels do |t|
      t.integer :user_id, null: false
      t.string :name, null: false
      t.date :start_date,null: false
      t.date :end_date,null: false

      t.timestamps
      
      t.index :user_id
    end
  end
end
