class CreateItems < ActiveRecord::Migration[8.0]
  def change
    create_table :items do |t|
      t.string :code
      t.string :name

      t.timestamps
    end
    add_index :items, :code, unique: true
  end
end
