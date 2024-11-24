class Passenger < ApplicationRecord
  belongs_to :booking
  validates :email, :name, presence: true
end
