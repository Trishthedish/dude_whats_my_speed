class RemovePaidPingToUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :paid_ping, :string
  end
end
