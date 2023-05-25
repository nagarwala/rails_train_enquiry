# frozen_string_literal: true

class CreateTrains < ActiveRecord::Migration[6.0]
  def change
    create_table :trains do |t|
      t.string :train_no
      t.string :train_name
      t.string :starting_station

      t.timestamps
    end
  end
end
