# frozen_string_literal: true

class StationsController < ApplicationController
  def index
    @stations = Station.paginate(page: params[:page], per_page: 10)
    authorize Station
  end

  def new
    @station = Station.new
    authorize @station
  end

  def create
    @station = Station.new(station_params)
    authorize @station
    if @station.save
      flash[:notice] = 'Station was saved successfully'
      redirect_to stations_path
    else
      render 'new'
    end
  end

  def edit
    @station = Station.find(params[:id])
    authorize @station
  end

  def update
    @station = Station.find(params[:id])
    if @station.update(station_params)
      flash[:notice] = 'Train was updated successfully'
      redirect_to stations_path
    else
      render 'edit'
    end
  end

  def destroy
    @station = Station.find(params[:id])
    @station.destroy
    flash[:notice] = 'Station was deleted succesfully'
    redirect_to stations_path
  end

  private

  def station_params
    params.require(:station).permit(:name, :location)
  end
end
