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
    # Income.where(bank_account: self.bank_account, month: Date.today.month).sum(:amount)
  end
end
