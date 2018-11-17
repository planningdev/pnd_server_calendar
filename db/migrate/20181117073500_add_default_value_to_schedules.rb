class AddDefaultValueToSchedules < ActiveRecord::Migration[5.2]
  def change
    change_column :schedules, :memo, :string, default: ""
  end
end
