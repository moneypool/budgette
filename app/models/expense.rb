class Expense < ApplicationRecord
  belongs_to :bank_account

  def self.by_categories_for(user)
    Expense
      .select('category as name, sum(amount) as total')
      .where(bank_account: user.bank_account)
      .group('category')
  end
end
