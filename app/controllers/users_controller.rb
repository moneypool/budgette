class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # @expenses = @user&.bank_account.expenses
    # @goals = @user&.goals
  end
end
