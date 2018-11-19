# frozen_string_literal: true

class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.string :title, null: false
      t.datetime :start, null: false
      t.datetime :finish, null: false
      t.boolean :all_day, default: false, null: false
      t.string :memo
      t.string :place
      t.timestamps
    end
  end
end
