class Room < ApplicationRecord
  KINDS = %w(single double twin suite).freeze

  belongs_to :property

  validates :name, presence: true
  validates :kind, presence: true
  validates :kind, inclusion: { in: KINDS }
end
