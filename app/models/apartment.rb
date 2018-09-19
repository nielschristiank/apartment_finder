class Apartment < ApplicationRecord
  validates :address_1, :city, :state, :postal_code, :country, presence: true
end
