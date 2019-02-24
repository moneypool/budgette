class DropIncomesTable < ActiveRecord::Migration[5.2]
  def up
    drop_table :incomes
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
