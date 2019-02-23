class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.references :user, foreign_key: true
      t.string :category
      t.float :amount

      t.timestamps
    end
  end
end
