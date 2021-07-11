class RemoveTravelIdFromTravels < ActiveRecord::Migration[5.0]
  def change
    remove_column :travels, :travel_id, :integer
  end
end
