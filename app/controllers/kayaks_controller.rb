class KayaksController < ApplicationController
  before_action :set_kayak, only: [:create, :update, :show, :destroy]

  def index
    @kayaks = Kayak.all
  end

  def new
    @kayak = Kayak.new
  end

  def create
    @kayaks = Kayak.new(kayak_params)
    if @kayak.save
      redirect_to kayak_path(@kayak)
    else
      render :new
    end
  end

  def edit

  end

  def show
    @kayaks = Kayak.find(params[:id])
  end

  def delete
    @kayak.destroy
    redirect_to kayaks_path
  end

  def update
  end

  private

  def set_kayak
    @kayaks = Kayak.find(params[:id])
  end

  def kayak_params
    params.require(:kayak).permit(:id, :description)
  end



end
