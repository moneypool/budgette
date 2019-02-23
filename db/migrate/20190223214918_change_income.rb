class ChangeIncome < ActiveRecord::Migration[5.2]
  def change
    add_column :incomes, :transaction_number, :integer
  end
end
