# frozen_string_literal: true

class TrainsController < ApplicationController
  def index
    if params[:query].present?
      @trains = Train.search(params[:query], load: true)
    else
      @trains = Train.paginate(page: params[:page], per_page: 5)
    end
    authorize Train
  end

  def new
    @train = Train.new
    authorize @train
  end

  def create
    @train = Train.new(train_params)
    authorize @train
    if @train.save
      flash[:notice] = 'Train was saved successfully'
      redirect_to trains_path
    else
      render 'new'
    end
  end

  def show
    @train = Train.find(params[:id])
    @train_stations = TrainStation.where(train_id: params[:id])
    authorize @train
  end

  def edit
    @train = Train.find(params[:id])
    authorize @train
  end

  def update
    @train = Train.find(params[:id])
    if @train.update(train_params)
      flash[:notice] = 'Train was updated successfully'
      redirect_to @train
    else
      render 'edit'
    end
  end

  def destroy
    @train = Train.find(params[:id])
    @train.destroy
    flash[:notice] = 'Train was deleted successfully'
    redirect_to trains_path
  end

  def search
    if params[:train].present?
      train = Train.where(train_name: params[:train])
      if train.present?
        redirect_to train_path(train.ids)
      else
        flash[:alert] = 'Please enter a valid train name'
        redirect_to trains_path
      end
    else
      flash[:alert] = 'Please enter a train name to search'
      redirect_to trains_path
    end
  end

  private

  def train_params
    params.require(:train).permit(:train_no, :train_name, :starting_station)
  end
end
