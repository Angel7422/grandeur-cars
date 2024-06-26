class Booking < ApplicationRecord
  attr_accessor :accept_terms

  belongs_to :user
  belongs_to :car

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :accept_terms, acceptance: { message: 'You must accept the terms and conditions' }

  before_create :set_default_status

  def duration_in_days
    (end_date.to_date - start_date.to_date).to_i + 1
  end

  def total_price
    duration_in_days * car.price
  end

  private

  def set_default_status
    self.status = "confirmed"
  end
end
