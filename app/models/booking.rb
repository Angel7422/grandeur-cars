class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :car

  validates :start_date, presence: true
  validates :end_date, presence: true

  before_create :set_default_status

  private

  def set_default_status
    self.status = "confirmed"
  end
end
