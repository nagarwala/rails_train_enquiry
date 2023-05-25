# frozen_string_literal: true

class CreateTrainStations < ActiveRecord::Migration[6.0]
  def change
    create_table :train_stations do |t|
      t.integer :train_id
      t.integer :station_id
      t.string  :arrival_time
      t.string  :departure_time
    end
  end
end
