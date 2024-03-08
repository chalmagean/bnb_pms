class Property < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  validates :email, presence: true
end
