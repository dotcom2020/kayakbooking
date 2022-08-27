class KayaksController < ApplicationController

  def index
    @kayaks = Kayak.all
  end

  def new
    @kayak = Kayak.new
  end

  def create
    kayak = Kayak.new(params[:id])
    if @kayak.save
      redirect_to models_url, notice: “Kayak successfully created.”
    else
      render :new
    end
  end

  def edit

  end

  def show
    @kayak = Kayak.find(params[:id])
  end

  def delete
    @kayak.destroy
    redirect_to lists_path
  end

  def update
  end

end
