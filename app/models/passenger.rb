class Passenger < ApplicationRecord
  has_many :passengers, through: :bookings
end
