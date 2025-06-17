class CreateInvoices < ActiveRecord::Migration[8.0]
  def change
    create_table :invoices do |t|
      t.string :invoice_number
      t.date :generated_on
      t.integer :status
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end

    add_index :invoices, :invoice_number, unique: true

  end
end
