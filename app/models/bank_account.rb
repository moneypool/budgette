class BankAccount < ApplicationRecord
  validates :name, presence: :true
  validates :account_number, presence: :true, numericality: { only_integer: true }

  belongs_to :user
  has_many :expenses
  has_many :incomes

  def connect!
    true
  end

  def generate_balance
    true
  end

  private

  def generate_incomes
  end

  def generate_expenses
  end
end
