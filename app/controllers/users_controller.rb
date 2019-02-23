class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @expenses_by_category = Expense.by_categories_for(@user)
  end
end
