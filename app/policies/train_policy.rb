# frozen_string_literal: true

class TrainPolicy
  attr_reader :current_user, :train

  def initialize(current_user, train)
    @current_user = current_user
    @train = train
  end

  def index?
    @current_user.admin? || @current_user.user?
  end

  def show?
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
