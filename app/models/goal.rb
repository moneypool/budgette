class Goal < ApplicationRecord
  belongs_to :user

  validates :category, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
end
