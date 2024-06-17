class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @cars = Car.all
    @bookings = Booking.all
  end

  def dashboard
    @cars = current_user.cars
    @bookings = current_user.bookings
  end
end
