class Property < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  validates :email, presence: true
  belongs_to :account
  has_many :rooms, dependent: :destroy
  has_many :availabilities, dependent: :destroy

  accepts_nested_attributes_for :rooms,
    reject_if: :all_blank,
    allow_destroy: true

  accepts_nested_attributes_for :availabilities,
    reject_if: proc { |attributes| attributes["rate"].blank? },
    allow_destroy: true
end
