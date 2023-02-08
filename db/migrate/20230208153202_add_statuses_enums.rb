class AddStatusesEnums < ActiveRecord::Migration[6.0]
  def up
    execute("CREATE TYPE merchant_statuses AS ENUM ('active', 'inactive');")
    execute("CREATE TYPE transaction_statuses AS ENUM ('pending', 'approved', 'reversed', 'refunded', 'error');")
  end

  def down
    execute('DROP TYPE merchant_statuses')
    execute('DROP TYPE transaction_statuses')
  end
end
