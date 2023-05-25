# frozen_string_literal: true

class CreateStations < ActiveRecord::Migration[6.0]
  def change
    create_table :stations do |t|
      t.string :name
      t.string :location

      t.timestamps
    end
  end
end
