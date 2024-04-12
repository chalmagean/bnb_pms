class Room < ApplicationRecord
  KINDS = %w(single double twin suite).freeze

  belongs_to :property
  has_many :availabilities, dependent: :destroy

  accepts_nested_attributes_for :availabilities,
    reject_if: proc { |attributes| attributes["rate"].blank? },
    allow_destroy: true

  validates :name, presence: true
  validates :kind, presence: true
  validates :kind, inclusion: { in: KINDS }
end
