class KayaksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
  before_action :set_kayak, only: [:update, :destroy, :show]

  def index
    @kayaks = Kayak.all
  end

  def new
    @kayak = Kayak.new
  end

  def create
    @kayak = Kayak.new(kayak_params)
    user = current_user
    @kayak.user = user
    if @kayak.save!
      redirect_to kayak_path(@kayak)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @kayak.update(kayak_params)
    redirect_to kayak_path(@kayak)
  end

  def show
  end

  def destroy
    @kayak.destroy
    redirect_to kayaks_path
  end

  private

  def set_kayak
    @kayak = Kayak.find(params[:id])
  end

  def kayak_params
    params.require(:kayak).permit(:id, :description, :price_per_day, :adress, :places, :color, :category, :length, :width, :buoy, :photo)
  end



end
