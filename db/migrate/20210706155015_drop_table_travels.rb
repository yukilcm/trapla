class DropTableTravels < ActiveRecord::Migration[5.0]
  def change
    drop_table :travels
  end
end
