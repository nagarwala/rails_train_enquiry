# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    authorize User
  end
end
