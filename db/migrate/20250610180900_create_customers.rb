class CreateCustomers < ActiveRecord::Migration[8.0]
  def change
    create_table :customers do |t|
      t.string :code
      t.string :name

      t.timestamps
    end
    add_index :customers, :code, unique: true
  end
end
