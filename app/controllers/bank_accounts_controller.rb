class BankAccountsController < ApplicationController
  def new
    @bank_account = BankAccount.new
  end

  def create
    @bank_account = BankAccount.create(bank_account_params)

    if @bank_account.connect! && @bank_account.save
      @bank_account.generate_balance
      redirect_to new_user_goal_path(current_user)
    else
      render :new
    end
  end

  protected

  def bank_account_params
    params.require(:bank_account).permit(:name, :account_number).merge(user: current_user)
  end
end
