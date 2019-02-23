class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @expenses_by_category = @user.bank_account.expenses.group_by(&:category)

    @food_expenses = @expenses_by_category['Food'].reduce(0) {|sum, expense| sum + expense.amount }
    @food_expenses = @expenses_by_category['Food'].reduce(0) {|sum, expense| sum + expense.amount }
    @food_expenses = @expenses_by_category['Food'].reduce(0) {|sum, expense| sum + expense.amount }
    @food_expenses = @expenses_by_category['Food'].reduce(0) {|sum, expense| sum + expense.amount }
    @food_expenses = @expenses_by_category['Food'].reduce(0) {|sum, expense| sum + expense.amount }
  end
end
