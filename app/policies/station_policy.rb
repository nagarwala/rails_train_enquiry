# frozen_string_literal: true

class StationPolicy
  attr_reader :current_user, :station

  def initialize(current_user, station)
    @current_user = current_user
    @station = station
  end

  def index?
    @current_user.admin? || @current_user.user?
  end

  def new?
    @current_user.admin?
  end

  def create?
    @current_user.admin?
  end

  def edit?
    @current_user.admin?
  end
end
