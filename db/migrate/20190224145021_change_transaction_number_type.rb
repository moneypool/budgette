class ChangeTransactionNumberType < ActiveRecord::Migration[5.2]
  def change
    change_column :incomes, :transaction_number, :string
    change_column :expenses, :transaction_number, :string
    add_index :incomes, :transaction_number, unique: true
    add_index :expenses, :transaction_number, unique: true
  end
end
