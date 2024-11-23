class Airport < ApplicationRecord
  has_many :arrival_flights, foreign_key: :arrival_airport_id, class_name: "Flight"
  has_many :departure_flights, foreign_key: :departure_airport_id, class_name: "Flight"

  validates :code, presence: :true, length: { is: 3 }
  validates_format_of :code, with: /^[A-Z]*$/, multiline: true
end
