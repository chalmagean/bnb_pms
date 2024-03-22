class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :account

  before_save :set_role

  private

    def set_role
      self.role = account.memberships.count.zero? ? "admin" : "member"
    end
end
