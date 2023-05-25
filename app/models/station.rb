# frozen_string_literal: true

class Station < ApplicationRecord
  has_many :train_stations, dependent: :destroy
  has_many :trains, through: :train_stations
  validates :name, presence: true, length: { minimum: 6 }
  validates :location, presence: true
  validates_uniqueness_of :name
end
