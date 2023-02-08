class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions, id: :uuid do |t|
      t.string :type, null: false, index: true
      t.bigint :merchant_id, index: true, foreign_key: true
      t.bigint :customer_id, index: true, foreign_key: true
      t.decimal :amount
      t.column :status, :transaction_statuses, default: :pending, null: false, index: true

      t.timestamps
    end
  end
end
