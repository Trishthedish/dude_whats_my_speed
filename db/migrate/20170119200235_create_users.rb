class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :service_provider
      t.decimal :monthly_cost
      t.decimal :paid_download
      t.decimal :paid_upload
      t.integer :area_code
      t.integer :api_key

      t.timestamps
    end
  end
end
