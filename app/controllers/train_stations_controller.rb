# frozen_string_literal: true

class TrainStationsController < ApplicationController
  def new
    @train_station = TrainStation.new
    authorize @train_station
  end

  def create
    @train_station = TrainStation.new(train_station_params)
    if @train_station.save
      flash[:notice] = 'Station was added to the train successfully'
      redirect_to trains_path
    else
      render 'new'
    end
  end

  def edit
    @train_station = TrainStation.find(params[:id])
    authorize @train_station
  end

  def update
    @train_station = TrainStation.find(params[:id])
    if @train_station.update(train_station_params)
      flash[:notice] = 'Station details for train was updated successfully'
      redirect_to train_path(@train_station.train_id)
    else
      render 'edit'
    end
  end

  private

  def train_station_params
    params.require(:train_station).permit(:train_id, :station_id, :arrival_time, :departure_time)
  end
end
