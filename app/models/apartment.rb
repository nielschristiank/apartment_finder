class Apartment < ApplicationRecord
  belongs_to :user
  validates :address_1, :city, :state, :postal_code, :country, presence: true
end
