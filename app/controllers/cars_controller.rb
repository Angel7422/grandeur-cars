class CarsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_car, only: [:show]

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

  def show; end

  def my_cars
    @cars = current_user.cars
  end

  private

  def car_params
    params.require(:car).permit(:name, :photo, :address, :price, :picture)
  end

  def set_car
    @car = Car.find(params[:id])
  end

end
