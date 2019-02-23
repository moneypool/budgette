class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :code, null: false

      t.timestamps
    end

    add_index :groups, :code, unique: true
  end
end
