class CreateExpenses < ActiveRecord::Migration[5.2]
  def change
    create_table :expenses do |t|
      t.references :bank_account, foreign_key: true
      t.string :category
      t.float :amount

      t.timestamps
    end
  end
end
