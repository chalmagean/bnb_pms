class Account < ApplicationRecord
  validates :name, presence: true
  has_many :properties, dependent: :destroy
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships

  def property
    properties.order("last_used_at DESC").first
  end
end
