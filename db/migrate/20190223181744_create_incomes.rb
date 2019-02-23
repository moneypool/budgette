class CreateIncomes < ActiveRecord::Migration[5.2]
  def change
    create_table :incomes do |t|
      t.string :amount
      t.references :bank_account, foreign_key: true

      t.timestamps
    end
  end
end
