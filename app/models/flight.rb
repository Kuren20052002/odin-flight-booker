class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"
  has_many :bookings, depedent: :destroy
  validate :departure_is_not_the_same_as_arrival

  scope :upcoming, -> { where(start_date: Time.now..) }

  private

  def departure_is_not_the_same_as_arrival
    if departure_airport_id == arrival_airport_id
      errors.add(:arrival_airport, "can't be the same as the departure airport")
    end
  end
end
