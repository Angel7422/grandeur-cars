class CarsController < ApplicationController
  #TODO before_action: set_car

  def index
    @cars = Car.all
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.user = current_user
    if @car.save
      redirect_to cars_path
    else
      render :new
    end
  end

  def show
    @booking = Booking.new
  end

  def my_cars
    @cars = current_user.cars
  end

  private

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:name, :photo, :address, :price)
  end
end
