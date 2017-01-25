class AddUserIdToRasberryPis < ActiveRecord::Migration[5.0]
  def change
    add_column :rasberry_pis, :user_id, :integer
  end
end
