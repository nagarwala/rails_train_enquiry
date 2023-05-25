# frozen_string_literal: true

class Train < ApplicationRecord
  has_many :train_stations, dependent: :destroy
  has_many :stations, through: :train_stations

  include Tire::Model::Search
  include Tire::Model::Callbacks
  
  VALID_TRAIN_NO_REGEX = /\A[0-9]+\z/.freeze
  validates :train_no, presence: true, length: { is: 5 }, 
                       format: { with: VALID_TRAIN_NO_REGEX, message: 'should consists of digits' }
  validates :train_name, presence: true, length: { minimum: 10, maximum: 50 }
  validates :starting_station, presence: true, length: { minimum: 10, maximum: 100 }
  validates_uniqueness_of :train_no, :train_name

end
