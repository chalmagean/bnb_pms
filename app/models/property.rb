class Property < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  validates :email, presence: true
  belongs_to :account
end
