class AddColumnTravels < ActiveRecord::Migration[5.0]
  def change
    add_column :travels, :travel_id, :integer
  end
end
