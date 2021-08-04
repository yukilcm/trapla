class CreateChecklists < ActiveRecord::Migration[5.0]
  def change
    create_table :checklists do |t|
      t.string :title, null: false
      t.integer :travel_id, null: false
      t.boolean :checked, null: false, default: false

      t.timestamps
    end
  end
end
