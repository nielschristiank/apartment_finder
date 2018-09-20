class User < ApplicationRecord
  has_many :apartments, dependent: :destroy
  include Devise::JWT::RevocationStrategies::JTIMatcher
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # :recoverable, :rememberable,
  devise :database_authenticatable,
         :registerable,
         :validatable,
         :jwt_authenticatable,
         jwt_revocation_strategy: self
end
