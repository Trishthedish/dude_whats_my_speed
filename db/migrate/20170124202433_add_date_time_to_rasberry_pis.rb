class AddDateTimeToRasberryPis < ActiveRecord::Migration[5.0]
  def change
    add_column :rasberry_pis, :date_time, :datetime
  end
end
