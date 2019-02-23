class Group < ApplicationRecord
  extend FriendlyId

  validates :name, presence: true

  has_many :memberships
  has_many :members, through: :memberships

  before_create :generate_code

  friendly_id :code

  private

  def generate_code
    self.code = SecureRandom.hex(16)
  end
end
