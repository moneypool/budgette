class AddFieldsToIncomesAndExpenses < ActiveRecord::Migration[5.2]
  def change
    add_column :expenses, :description, :string
    add_column :expenses, :transaction_date, :datetime

    add_column :incomes, :description, :string
    add_column :incomes, :transaction_date, :datetime
  end
end
