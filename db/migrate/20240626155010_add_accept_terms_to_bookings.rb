class AddAcceptTermsToBookings < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :accept_terms, :boolean
  end
end
