class UsersController < ApplicationController
  def show
    @user = current_user
    @expenses_by_category = Expense.by_categories_for(@user)
  end
end
