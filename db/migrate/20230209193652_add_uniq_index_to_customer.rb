class AddUniqIndexToCustomer < ActiveRecord::Migration[6.0]
  def change
    remove_index :customers, :email
    add_index :customers, :email, unique: true
  end
end
