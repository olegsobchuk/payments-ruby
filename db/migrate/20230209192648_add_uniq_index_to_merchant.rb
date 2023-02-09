class AddUniqIndexToMerchant < ActiveRecord::Migration[6.0]
  def change
    remove_index :merchants, :email
    add_index :merchants, :email, unique: true
  end
end
