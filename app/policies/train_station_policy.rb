# frozen_string_literal: true

class TrainStationPolicy
  attr_reader :current_user, :train_station

  def initialize(current_user, train_station)
    @current_user = current_user
    @train_station = train_station
  end

  def new?
    @current_user.admin?
  end

  def edit?
    @current_user.admin?
  end
end
