class BookingsController < ApplicationController
  before_action :set_booking, only: [:edit, :update, :destroy]

  def new
    @kayak = Kayak.find(params[:kayak_id])
    @booking = Booking.new
  end

  def create
    user = current_user
    kayak = Kayak.find(params[:kayak_id])
    @booking = Booking.new(booking_params)
    @booking.user = user
    @booking.kayak = kayak
    @booking.status = "Pending"
    start_date = params[:booking][:start_date].split(" to ").first.to_date.mjd
    end_date = params[:booking][:end_date].to_date.mjd
    total_days = end_date - start_date
    total_price = total_days * kayak.price_per_day
    @booking.total_price = total_price
    if @booking.save!
      redirect_to dashboard_path
    else
      render 'new'
    end
  end

  def edit
    @booking.edit
  end

  def update
    @booking.update!(booking_params)
    redirect_to booking_path(@booking)
  end

  def destroy
    @booking.destroy
    redirect_to dashboard_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:status, :total_price, :kayak_id, :user_id, :start_date, :end_date)
  end
end
