class CreateInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :invoices do |t|
      t.string :title
      t.text :description
      t.string :deadline
      t.integer :currency
      t.integer :total
      t.timestamp :start_date
      t.timestamp :end_date
      t.string :status, :default => 'pending'
      t.timestamps
    end
  end
end
