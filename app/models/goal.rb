class Goal < ApplicationRecord
  belongs_to :user

  validates :category, presence: true
  validates :amount, presence: true
end
