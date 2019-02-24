class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :goals
  has_one :bank_account
  has_many :memberships
  has_many :groups, through: :memberships

  def monthly_income
    Income.where(bank_account: self.bank_account).sum(:amount)
  end

  def progress
    return 0 if goals.sum(:amount).zero?
    (monthly_expenses * 100) / goals.sum(:amount)
  end

  def expenses
    bank_account.expenses
  end

  def total_expenses
    bank_account.expenses.sum(:amount)
  end

  def monthly_expenses
    expenses.where(created_at: (Date.today.beginning_of_month..Date.today.end_of_month)).sum(:amount)
  end

  def total_goal
    goals.sum(:amount)
  end
end
