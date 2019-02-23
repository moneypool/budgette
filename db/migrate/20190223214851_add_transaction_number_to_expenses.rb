class AddTransactionNumberToExpenses < ActiveRecord::Migration[5.2]
  def change
    add_column :expenses, :transaction_number, :integer
  end
end
