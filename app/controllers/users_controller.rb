class UsersController < ApplicationController
  def show
    @user = current_user
    @expenses_by_category = Expense.by_categories_for(@user)
    @total_income = @user.bank_account.incomes.where('transaction_date > ?', 30.days.ago).sum(:amount)
    @total_expense = @user.bank_account.expenses.where('transaction_date > ?', 30.days.ago).sum(:amount)
    @transactions = (@user.bank_account.incomes.limit(10) + @user.bank_account.expenses.limit(10)).sort_by(&:transaction_date).reverse
  end
end
