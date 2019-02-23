class BankAccount < ApplicationRecord
  belongs_to :user
  has_many :expenses
  has_many :incomes
end
