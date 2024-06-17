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

  def create
    @car = Car.find(params[:car_id])
    @booking = Booking.new(booking_params)
    @booking.car = @car
    @booking.user = current_user
    @booking.status = "pending"
    # recuperer le start date et end date
    # calculer le nombre de jours de difference entre les 2

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

  def validate; end

  def reject; end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :user_id, :car_id, :end_date, :status)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
