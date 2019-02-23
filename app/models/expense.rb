class Expense < ApplicationRecord
  belongs_to :bank_account

  def self.by_categories_for(user)
    Expense
      .select('category as category, sum(amount) as budget')
      .where(bank_account: user.bank_account)
      .gruop('category')
  end
end
