class CreateRasberryPis < ActiveRecord::Migration[5.0]
  def change
    create_table :rasberry_pis do |t|
      t.string :date
      t.decimal :ping
      t.decimal :download
      t.decimal :upload

      t.timestamps
    end
  end
end
