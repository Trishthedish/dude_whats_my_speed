class CreateServices < ActiveRecord::Migration[5.0]
  def change
    create_table :services do |t|
      t.string :name
      t.string :company
      t.decimal :max_ad_download
      t.decimal :max_ad_upload
      t.decimal :max_download
      t.decimal :max_upload

      t.timestamps
    end
  end
end
