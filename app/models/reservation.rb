class Reservation < ApplicationRecord
  belongs_to :property
  has_and_belongs_to_many :guests

  validates :check_in, presence: true
  validates :check_out, presence: true
  validates :room_type, presence: true
  validates :quantity, presence: true
end
