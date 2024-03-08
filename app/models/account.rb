class Account < ApplicationRecord
  validates :name, presence: true
  has_many :properties, dependent: :destroy
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships
end
