class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :memberships, dependent: :destroy
  has_many :accounts, through: :memberships

  def account
    accounts.order("memberships.last_used_at DESC").first
  end
end
