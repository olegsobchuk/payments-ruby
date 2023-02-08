class CreateMerchants < ActiveRecord::Migration[6.0]
  def change
    create_table :merchants do |t|
      t.string :name, null: false
      t.text :description
      t.string :email, null: false, index: true
      t.column :status, :merchant_statuses, default: :active, null: false, index: true

      t.timestamps
    end
  end
end
