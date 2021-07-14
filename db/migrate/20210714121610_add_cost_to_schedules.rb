class AddCostToSchedules < ActiveRecord::Migration[5.0]
  def change
    add_column :schedules, :cost, :integer
  end
end
