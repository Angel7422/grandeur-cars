class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_booking, only: [:validate, :reject]

  def index
    if params[:car_id].present?
      @car = Car.find(params[:car_id])
      @bookings = Booking.where(car_id: @car.id, user_id: current_user.id)
    else
      @bookings = Booking.where(user_id: current_user.id)
    end
  end

  def new
    @car = Car.find(params[:car_id])
    @booking = Booking.new
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @car = Car.find(params[:car_id])
    @booking = Booking.new(booking_params)
    @booking.car = @car
    @booking.user = current_user
    @booking.status = "pending"
    # verifier et parser les dates uniquement si elles ne sont pas vides
    return render :new, status: :unprocessable_entity unless params["booking"]["start_date"].present? && params["booking"]["end_date"].present?

    start_date = Date.parse(params["booking"]["start_date"])
    end_date = Date.parse(params["booking"]["end_date"])

    @booking.start_date = start_date
    @booking.end_date = end_date

    num_days = (end_date - start_date).to_i
    @booking.booking_price = num_days * @car.price
    if @booking.save
      redirect_to bookings_path, notice: 'Booking was successfully created.', status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  def validate
    # @booking = Booking.find(params[:id])
    # @booking.update(status: "approved")
    # redirect_to @booking, notice: "Booking approved!"
  end

  def reject
    # @booking = Booking.find(params[:id])
    # @booking.update(status: "rejected")
    # redirect_to @booking, notice: "Booking rejected."
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :user_id, :car_id, :end_date, :status)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
