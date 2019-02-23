class ApiCallbacksController < ApplicationController
  def new
    api_con = ApiConnection.new(params[:code], current_user)
    api_con.retrieve_bank_account
    api_con.retrieve_transactions
    redirect_to new_goal_path
  end
end
