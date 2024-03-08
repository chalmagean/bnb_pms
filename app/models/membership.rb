class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :account

  validates :role, presence: true
end
