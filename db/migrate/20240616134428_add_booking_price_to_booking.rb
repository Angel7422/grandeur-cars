class AddBookingPriceToBooking < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :booking_price, :integer
  end
end
