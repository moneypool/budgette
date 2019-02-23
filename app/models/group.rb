class Group < ApplicationRecord
  validates :name, presence: true

  has_many :memberships
  has_many :members, through: :memberships

  before_create :generate_code

  private

  def generate_code
    self.code = SecureRandom.hex(16)
  end
end
