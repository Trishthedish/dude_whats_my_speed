class AddPaidPingToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :paid_ping, :decimal
  end
end
