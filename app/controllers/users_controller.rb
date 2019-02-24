class UsersController < ApplicationController
  def show
    @user = current_user
    @expenses_by_category = Expense.by_categories_for(@user)
    @total_income = @user.bank_account.incomes.where('created_at > ?', 30.days.ago).sum(:amount)
    @total_expense = @user.bank_account.expenses.where('created_at > ?', 30.days.ago).sum(:amount)
  end
end
